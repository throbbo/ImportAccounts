alter table accounts add is_pre_starter bit null
go
update accounts set is_pre_starter = 0
alter table accounts alter column is_pre_starter bit not null