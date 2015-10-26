
if exists(select 1 from sysobjects where name  = 'refresh_spend_by_day_sp')
	drop procedure refresh_spend_by_day_sp
go
create procedure refresh_spend_by_day_sp as
begin
	SET DATEFIRST 1;
	
	declare @fixed_start_month datetime, @fixed_start_week datetime

	declare @max_previously_processed_transaction_id int = (select spend_by_day_max_processed_transaction_id from spend_management_processing_ids)
	declare @fixed_start_date datetime =  (select fixed_start_processing_date from spend_management_processing_ids)
	 
	select @fixed_start_month = DATEADD(month, DATEDIFF(month, 0, @fixed_start_date), 0),
		@fixed_start_week = cast(cast(DATEADD(dd, -(DATEPART(dw, @fixed_start_date)-1), @fixed_start_date) as date) as datetime)

	declare @max_processed_transaction_id int = (SELECT max(transaction_id)
		FROM accounts a
				inner join billing_periods bp on a.client_id = bp.client_id
				inner join transactions t on t.account_id = a.account_id and t.billing_period_id = bp.billing_period_id         
		where not exists(select 1 from transaction_types tt
			inner join transaction_type_categories tc on tc.transaction_type_category_id = tt.transaction_type_category_id
				where tt.transaction_type_id = t.transaction_type_id 
				and tt.card_scheme_id = t.card_scheme_id
				and tc.translation_key in ('PAYMENTS'))
		and t.transaction_id > @max_previously_processed_transaction_id)
	
	if (@max_processed_transaction_id is null 
			or @max_processed_transaction_id <= @max_previously_processed_transaction_id) return;

	-- To completely refresh, set to zero
	if (@max_previously_processed_transaction_id = 0)
	begin
		delete from spend_by_day
	end
		
	;WITH new_spend as (
		SELECT	a.client_id, 
			t.posting_applied day_start_date
			,count(1) transaction_count
			,sum(isnull(t.amount,0)) spend_amount
			,datediff(month, @fixed_start_month, t.posting_applied) month_no
			,datediff(wk, @fixed_start_week, DATEADD(dd, -(DATEPART(dw, t.posting_applied)-1), t.posting_applied)) week_no
			,datediff(day, @fixed_start_date, t.posting_applied) day_no
			,DATEADD(dd, -(DATEPART(dw, t.posting_applied)-1), t.posting_applied) week_start_date 
			,DATEADD(month, DATEDIFF(month, 0, t.posting_applied), 0) month_start_date
		FROM transactions t 
			inner join accounts a on t.account_id = a.account_id              
			inner join billing_periods on a.client_id = billing_periods.client_id
		where t.transaction_id > @max_previously_processed_transaction_id
		and t.transaction_id <= @max_processed_transaction_id
		and t.billing_period_id = billing_periods.billing_period_id 
		and not exists(select 1 from transaction_types tt
			inner join transaction_type_categories tc on tc.transaction_type_category_id = tt.transaction_type_category_id
				where tt.transaction_type_id = t.transaction_type_id 
				and tt.card_scheme_id = t.card_scheme_id
				and tc.translation_key in ('PAYMENTS'))
		group by a.client_id, t.posting_applied)


	merge spend_by_day as target
		using 
		(
		  select * from new_spend
		) as source on target.client_id = source.client_id and target.day_start_date = source.day_start_date
	when matched then
		update set spend_total = spend_total + source.spend_amount,
					transaction_count = target.transaction_count + source.transaction_count
	when not matched then
		insert (
			client_id,
			day_start_date,
			transaction_count,
			spend_total,
			month_no,
			week_no,
			day_no,
			week_start_date,
			month_start_date
		)
		values (source.client_id,
			source.day_start_date,
			source.transaction_count,
			source.spend_amount,
			source.month_no,
			source.week_no,
			source.day_no,
			source.week_start_date,
			source.month_start_date);

	insert into spend_by_day (
		client_id,
		day_start_date,
		transaction_count,
		spend_total,
		month_no,
		week_no,
		day_no,
		week_start_date,
		month_start_date
	)
	select c.client_id, sd.date
		,0 transaction_count
		,0 spend_total
		,datediff(month, @fixed_start_month, sd.date) month_no
		,datediff(wk, @fixed_start_week, DATEADD(dd, -(DATEPART(dw, sd.date)-1), sd.date)) week_no
		,datediff(day, @fixed_start_date, sd.date) day_no
		,DATEADD(dd, -(DATEPART(dw, sd.date)-1), sd.date) week_start_date 
		,DATEADD(month, DATEDIFF(month, 0, sd.date), 0) month_start_date 
	from clients c 
		cross join system_dates sd
	where not exists(select 1 from spend_by_day s 
		where s.client_id= c.client_id and s.day_start_date = sd.date)

	update spend_management_processing_ids
	set spend_by_day_max_processed_transaction_id = @max_processed_transaction_id
end
go

exec refresh_spend_by_day_sp
go
