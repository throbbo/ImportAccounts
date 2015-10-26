if exists(select 1 from sysobjects where name  = 'spend_by_period')
	drop table spend_by_period
go

CREATE TABLE spend_by_period
(
     client_id int NOT NULL FOREIGN KEY REFERENCES clients(client_id),
	 billing_period_id int NOT NULL FOREIGN KEY REFERENCES billing_periods(billing_period_id),
     cycle_spending_limit decimal(18,4) NOT NULL,
     spend_cycle decimal(18,4) NOT NULL,
     balance decimal(18,4) NOT NULL,
     total_facility_limit decimal(18,4) NOT NULL, 
     CONSTRAINT pk_spend_by_period PRIMARY KEY (client_id,billing_period_id)
)
go


if exists(select 1 from sysobjects where name  = 'refresh_spend_by_period_sp')
	drop procedure refresh_spend_by_period_sp
go
create procedure refresh_spend_by_period_sp (@periods_back int = 120) as 
begin
	truncate table spend_by_period;

	;WITH ab AS (
		   select ab.*
		   FROM
				  account_balances ab
				  inner join (
						 select MAX(date) [balancedate], account_id, billing_period_id
						 from account_balances
						 GROUP BY account_id, billing_period_id) latestb 
				  on ab.account_id = latestb.account_id
						 and ab.billing_period_id = latestb.billing_period_id
						 and ab.date = latestb.balancedate
	), periodTransactions AS (
		   SELECT sum(isnull(t.amount,0)) amount, a.account_id, billing_periods.billing_period_id
		   FROM
				  accounts a
				  inner join billing_periods on a.client_id = billing_periods.client_id
				  left join transactions t on t.account_id = a.account_id              
				  left join transaction_types tt on t.transaction_type_id = tt.transaction_type_id
				  left join transaction_type_categories ttc on tt.transaction_type_category_id = ttc.transaction_type_category_id
		   where t.transaction_date IS NULL OR (t.billing_period_id = billing_periods.billing_period_id and ttc.name != 'Payments')
		   group by a.account_id, billing_periods.billing_period_id
	), spendAndBalance AS (
		   select a.client_id, sum(isnull(ab.open_to_buy, 0.0)) balance, sum(pt.amount) spend, pt.billing_period_id
		   from accounts a                          
				  inner join periodTransactions pt on pt.account_id = a.account_id
				  left join ab on ab.account_id = a.account_id and ab.billing_period_id = pt.billing_period_id
		   where a.parent_account_id IS NOT NULL
		   group by a.client_id, pt.billing_period_id
	)
	INSERT INTO spend_by_period (
		client_id,
		total_facility_limit,
		billing_period_id,
		cycle_spending_limit,
		spend_cycle,
		balance	) 
	select 
		c.client_id
		,(select max(a.cycle_spending_limit) 
				from accounts a 
			 where a.client_id = c.client_id 
			 and a.parent_account_id IS NULL) total_facility_limit
		,spend_summary.billing_period_id
		,isnull(a.cycle_spending_limit,0) cycle_spending_limit
		,ISNULL(spend_summary.spend, 0) [spend_current_cycle]
		,ISNULL(spend_summary.balance, 0) [balance]     
	from clients c
		   inner join (select client_id, sum(cycle_spending_limit) [cycle_spending_limit] from accounts where parent_account_id is not null group by client_id) a on c.client_id = a.client_id
		   left join spendAndBalance spend_summary on spend_summary.client_id = c.client_id
		   left join ordered_billing_periods_view bp on spend_summary.billing_period_id = bp.billing_period_id
	where bp.RowNo <= @periods_back
end
go
