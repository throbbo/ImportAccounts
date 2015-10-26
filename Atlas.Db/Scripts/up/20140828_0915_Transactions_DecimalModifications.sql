drop index idx_transactions_account on transactions 
go
alter table transactions alter column source_amount decimal(18,4) not null;
alter table transactions alter column tax_amount decimal(18,4) not null;
alter table transactions alter column amount decimal(18,4) not null;
create index idx_transactions_account ON transactions (account_id ASC) INCLUDE (billing_period_id, amount);