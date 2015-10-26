alter table users add additional_data nvarchar(max) null;
go
update users set additional_data = ''
alter table users alter column additional_data nvarchar(max) not null;
