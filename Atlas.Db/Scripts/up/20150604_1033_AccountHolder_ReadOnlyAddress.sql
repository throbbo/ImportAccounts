alter table account_holders add read_only_address bit null
go
update account_holders set read_only_address = 0
alter table account_holders alter column read_only_address bit not null