alter table clients add cycle_code nvarchar(255) null
go
update clients set cycle_code = ''
alter table clients alter column cycle_code nvarchar(255) not null