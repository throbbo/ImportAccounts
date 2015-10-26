IF OBJECT_ID('dbo.client_spend_view', 'V') IS NOT NULL
    DROP VIEW dbo.client_spend_view
GO

CREATE VIEW [dbo].[client_spend_view]
AS
	WITH bp AS (
		SELECT *, ROW_NUMBER()
		over (
			PARTITION BY client_id
			order by end_date desc
		) AS RowNo
		FROM billing_periods
	)
	select c.client_id
		,isnull(c.spending_limit,0) cycle_spending_limit
		,isnull(spend_summary.spend_current_cycle,0) spend_current_cycle
		,isnull(cycle_last.spend_last_cycle,0) spend_last_cycle
		,isnull(cycle_2ndlast.spend_2ndlast_cycle,0) spend_2ndlast_cycle
		,isnull((100 * ( c.spending_limit - spend_summary.spend_current_cycle ) / NULLIF(c.spending_limit,0)),0) remaining_credit_percent
		,isnull((100 * ( cycle_2ndlast.spend_2ndlast_cycle - cycle_last.spend_last_cycle ) / NULLIF(cycle_2ndlast.spend_2ndlast_cycle,0)),0) spend_drop_last_two_periods_percent
	from clients c
	left join (select a.client_id, sum(abs.current_balance) spend_current_cycle
			from accounts a
			left join account_snapshots abs on a.account_id = abs.account_id
			where a.parent_account_id is not null
			group by a.client_id) spend_summary on spend_summary.client_id = c.client_id

	left join (select a.client_id, sum(ab.balance) spend_last_cycle
				from accounts a
					inner join bp on a.client_id = bp.client_id
					inner join account_balances ab on a.account_id = ab.account_id and ab.billing_period_id = bp.billing_period_id
				where bp.rowno = 2
				and a.parent_account_id is not null
				group by a.client_id) cycle_last on cycle_last.client_id = c.client_id

	left join (select a.client_id, sum(ab.balance) spend_2ndlast_cycle
				from accounts a
					inner join bp on a.client_id = bp.client_id
					inner join account_balances ab on a.account_id = ab.account_id and ab.billing_period_id = bp.billing_period_id
				where bp.rowno = 3
				and a.parent_account_id is not null
				group by a.client_id) cycle_2ndlast on cycle_2ndlast.client_id = c.client_id
go
