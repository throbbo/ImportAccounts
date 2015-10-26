
CREATE VIEW [dbo].[client_spend_view]
AS
select c.client_id
	,isnull(c.spending_limit,0) cycle_spending_limit
	,isnull(spend_summary.spend_current_cycle,0) spend_current_cycle
	,isnull(cycle_last.spend_last_cycle,0) spend_last_cycle
	,isnull(cycle_2ndlast.spend_2ndlast_cycle,0) spend_2ndlast_cycle
	,isnull((100 * ( c.spending_limit - cycle_last.spend_last_cycle ) / NULLIF(c.spending_limit,0)),0) remaining_credit_percent
	,isnull((100 * ( cycle_2ndlast.spend_2ndlast_cycle - cycle_last.spend_last_cycle ) / NULLIF(cycle_2ndlast.spend_2ndlast_cycle,0)),0) spend_drop_last_two_periods_percent
from clients c
left join (select a.client_id, a.billing_account_id, sum(t.amount) spend_current_cycle
			from accounts a 
				inner join transactions t on a.account_id = t.account_id
			where t.amount > 0
			and t.statement_date >= dateadd(month, datediff(month, 0, getutcdate()), 0)
            and t.statement_date <= getutcdate()
			group by a.client_id,a.billing_account_id) spend_summary on spend_summary.client_id = c.client_id
left join (select a.client_id, sum(t.amount) spend_last_cycle
			from accounts a
				inner join transactions t on a.account_id = t.account_id
			where t.amount > 0
			and t.statement_date >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)
            and t.statement_date <= DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1)
			group by a.client_id,a.billing_account_id) cycle_last on cycle_last.client_id = c.client_id
left join (select a.client_id, sum(t.amount) spend_2ndlast_cycle
			from accounts a 
				inner join transactions t on a.account_id = t.account_id
			where t.amount > 0
			and t.statement_date >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-2, 0)
            and t.statement_date <= DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-2, -1)
			group by a.client_id,a.billing_account_id) cycle_2ndlast on cycle_2ndlast.client_id = c.client_id
go
