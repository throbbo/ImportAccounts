CREATE TABLE [dbo].[user_exchange_rates](
	[user_exchange_rate_id] [int] IDENTITY(1,1) NOT NULL primary key,
	[user_id] [int] NOT NULL constraint fk_user_exchange_rates__user_id references users(user_id),
	[from_currency_iso_number] [int] NOT NULL constraint fk_user_exchange_rates__from_currency_iso_number references currencies(currency_iso_number),
	[rate] [decimal](18, 8) NOT NULL)
GO

WITH date_table
AS
(
    SELECT cast ('2013-03-16' as Date) AS [DATE]
    UNION ALL
    SELECT DATEADD(dd, 1, [DATE])
    FROM date_table
    WHERE DATEADD(dd, 1, [DATE]) < '2017-04-15'
)
select dt.date into system_dates
from date_table dt
option (maxrecursion 3000)