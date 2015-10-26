alter table accounts add additional_data nvarchar(max) null;
go
update accounts set additional_data = ''
alter table accounts alter column additional_data nvarchar(max) not null;
