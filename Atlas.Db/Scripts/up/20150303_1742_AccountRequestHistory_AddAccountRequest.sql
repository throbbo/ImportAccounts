alter table account_request_histories add account_request nvarchar(max) null;
go
update account_request_histories set account_request = ''
alter table account_request_histories alter column account_request nvarchar(max) not null