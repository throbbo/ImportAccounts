alter table account_balances add account_balance_type nvarchar(max) null
go
update account_balances set account_balance_type = 'Opening' where account_balance_id in (select opening_account_balance_id from account_statements)
update account_balances set account_balance_type = 'Closing' where account_balance_id in (select closing_account_balance_id from account_statements)
update account_balances set account_balance_type = 'Daily'   where account_balance_type is null
alter table account_balances alter column account_balance_type nvarchar(max) not null