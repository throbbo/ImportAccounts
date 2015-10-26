alter table clients add read_only_address bit null
go
update clients set read_only_address = 0
alter table clients alter column read_only_address bit not null