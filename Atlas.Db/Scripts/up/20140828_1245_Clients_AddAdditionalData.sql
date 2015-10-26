alter table clients add additional_data nvarchar(max) null;
go
update clients set additional_data = ''
alter table clients alter column additional_data nvarchar(max) not null;
