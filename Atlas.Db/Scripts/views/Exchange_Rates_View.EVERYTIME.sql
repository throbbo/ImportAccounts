IF OBJECT_ID('dbo.exchange_rates_view', 'V') IS NOT NULL
    DROP VIEW dbo.exchange_rates_view
GO

CREATE VIEW [dbo].[exchange_rates_view]
AS
    select uer.user_exchange_rate_id, uer.user_id, uer.from_currency_iso_number, uer.rate, u.consolidation_currency_iso_number to_currency_iso_number, sd.date as exchange_date 
    from user_exchange_rates uer 
        cross join system_dates sd
        inner join users u on uer.user_id = u.user_id
    union 
    select 0, u.user_id, c.currency_iso_number from_currency_iso_number, 1 as rate, u.consolidation_currency_iso_number to_currency_iso_number, sd.date as exchange_date 
    from users u 
        cross join (select distinct currency_iso_number from clients) c
        cross join system_dates sd
    where not exists (select 1 from user_exchange_rates uer1
        where uer1.user_id = u.user_id 
        and uer1.from_currency_iso_number = c.currency_iso_number) 