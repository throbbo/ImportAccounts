alter table billing_periods add is_pre_starter bit null
go
update billing_periods set is_pre_starter = 0
alter table billing_periods alter column is_pre_starter bit not null