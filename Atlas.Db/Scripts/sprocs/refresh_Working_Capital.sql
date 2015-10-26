if exists(select 1 from sysobjects where name  = 'refresh_working_capital_sp')
    drop procedure refresh_working_capital_sp
go
create procedure refresh_working_capital_sp (@todayinput datetime = null) as 
begin

    declare @today datetime = coalesce(@todayinput, getdate())

    merge working_capital_by_day as target
    using 
    (
        select 
            sd.date as transaction_date, 
            ta.client_id, 
            st.currency_iso_number, 
            count(st.transaction_id) as transaction_count,
            sum(st.amount) as amount_total
        from transactions st
            cross join system_dates sd
            inner join accounts ta on ta.account_id = st.account_id
            inner join transaction_types stt on stt.transaction_type_id = st.transaction_type_id and stt.card_scheme_id = st.card_scheme_id
            inner join transaction_type_categories sttc on sttc.transaction_type_category_id = stt.transaction_type_category_id
        where st.transaction_date <= sd.date
            and sttc.translation_key not in ('PAYMENTS')
            and sd.date < @today+1 
            and sd.date > @today-40
            and st.billing_period_id not in
            (
                select tsa.billing_period_id
                from account_statements tsa
                where tsa.account_id = ta.account_id
                and tsa.payment_due_date <= sd.date
            )
            and not exists (select 1 from working_capital_by_day
                            where client_id = ta.client_id
                            and transaction_date = sd.date
                            and currency_iso_number = st.currency_iso_number
                            and sd.date < @today-10)
        group by 
            sd.date,
            ta.client_id,
            st.currency_iso_number
    ) as source
    on target.transaction_date = source.transaction_date
        and target.client_id = source.client_id
        and target.currency_iso_number = source.currency_iso_number
    when matched then
        update set 
            transaction_count = source.transaction_count, 
            amount_total = source.amount_total
    when not matched then
        insert (transaction_date, 
                client_id, 
                currency_iso_number, 
                transaction_count, 
                amount_total)
        values (source.transaction_date, 
                source.client_id, 
                source.currency_iso_number, 
                source.transaction_count, 
                source.amount_total);

end
go
