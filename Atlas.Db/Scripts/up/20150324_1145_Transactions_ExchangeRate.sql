alter table [transactions] add exchange_rate numeric(24,10) null
go
update [transactions] set exchange_rate = source_amount / amount
alter table [transactions] alter column exchange_rate numeric(24,10) not null