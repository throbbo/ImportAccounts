alter table [card_schemes] add has_daily_balances bit null
go
update [card_schemes] set has_daily_balances = 0
alter table [card_schemes] alter column has_daily_balances bit not null