if exists(select 1 from sysobjects where name  = 'refresh_spend_by_period_sp')
	drop procedure refresh_spend_by_period_sp
go
create procedure refresh_spend_by_period_sp as 
begin
	SET DATEFIRST 1;

	declare @max_processed_transaction_id int =
			 isnull((select spend_by_period_max_processed_transaction_id from spend_management_processing_ids),0)

    declare @spend_by_period table 
	(
		client_id int,
		billing_period_id int,
		total_facility_limit decimal(24,2),
		cycle_spending_limit decimal(24,2),
		cycle_spend  decimal(24,2),
		max_transaction_id  int
	)

	-- To completely refresh, set to zero
	if (@max_processed_transaction_id = 0)
	begin
		delete from spend_by_period
	end
	
	;with by_account as (
		SELECT 
			a.client_id, 
			bp.billing_period_id, 
			isnull((select max(isnull(cycle_spending_limit,0)) 
				from accounts
				where client_id = a.client_id 
				and parent_account_id IS NULL),0) total_facility_limit,
			isnull(a.cycle_spending_limit,0) cycle_spending_limit,  
			isnull(sum(isnull(t.amount,0)),0) transaction_spend, 
			(select balance from account_balances where account_id = a.account_id and billing_period_id = bp.billing_period_id and account_balance_type = 'Closing') account_balance_spend, 
			max(isnull(t.transaction_id,0)) max_transaction_id
		FROM accounts a
			inner join billing_periods bp on a.client_id = bp.client_id
			inner join transactions t on t.account_id = a.account_id and t.billing_period_id = bp.billing_period_id
		where not exists(select 1 from transaction_types tt
					inner join transaction_type_categories tc on tc.transaction_type_category_id = tt.transaction_type_category_id
					where tt.transaction_type_id = t.transaction_type_id
					and tt.card_scheme_id = t.card_scheme_id
					and tc.translation_key in ('PAYMENTS'))
		and a.parent_account_id is not null
		and	t.transaction_id > @max_processed_transaction_id
		group by a.client_id, a.account_id, a.cycle_spending_limit, bp.billing_period_id
	)
	insert into @spend_by_period (
		client_id,
		billing_period_id,
		total_facility_limit,
		cycle_spending_limit,
		cycle_spend,
		max_transaction_id )
	select 
		s.client_id,
		s.billing_period_id,
		max(total_facility_limit) total_facility_limit,
		max(cycle_spending_limit) cycle_spending_limit,    
		isnull(nullif(sum(isnull(account_balance_spend, 0)),0), sum(transaction_spend)) cycle_spend, 
		max(max_transaction_id) max_transaction_id
	from by_account s
	group by s.client_id, s.billing_period_id

	merge spend_by_period as target
    using 
	(
	  select * from @spend_by_period
	) as source on target.client_id = source.client_id and target.billing_period_id = source.billing_period_id
    
	when matched and source.cycle_spend != 0 then
        update set 
            cycle_spend = target.cycle_spend + source.cycle_spend
    when not matched then
        insert (client_id,
				billing_period_id,
				total_facility_limit,
				cycle_spending_limit,
				cycle_spend)
        values( source.client_id, 
                isnull(source.billing_period_id,0), 
                source.total_facility_limit, 
                source.cycle_spending_limit, 
				source.cycle_spend);

	SELECT @max_processed_transaction_id = max(max_transaction_id) FROM @spend_by_period

	update spend_management_processing_ids
	set spend_by_period_max_processed_transaction_id = @max_processed_transaction_id;
end
go

exec refresh_spend_by_period_sp
go
