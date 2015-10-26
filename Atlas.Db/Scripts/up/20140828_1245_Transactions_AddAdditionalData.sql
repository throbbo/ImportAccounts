alter table transactions add additional_data nvarchar(max) null;
go
update transactions set additional_data = ''
alter table transactions alter column additional_data nvarchar(max) not null;
