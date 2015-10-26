alter table billing_periods add additional_data nvarchar(max) null;
go
update billing_periods set additional_data = ''
alter table billing_periods alter column additional_data nvarchar(max) not null;
