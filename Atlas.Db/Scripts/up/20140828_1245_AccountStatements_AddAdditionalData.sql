alter table account_statements add additional_data nvarchar(max) null;
go
update account_statements set additional_data = ''
alter table account_statements alter column additional_data nvarchar(max) not null;
