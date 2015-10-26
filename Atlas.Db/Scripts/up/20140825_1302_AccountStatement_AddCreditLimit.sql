alter table account_statements add credit_limit decimal(16,4) null;
go
update account_statements set credit_limit = 0
alter table account_statements alter column credit_limit decimal(16,4) not null;