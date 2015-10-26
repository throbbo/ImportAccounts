alter table clients add is_pre_starter bit null
GO
update clients set is_pre_starter = 0
alter table clients alter column is_pre_starter bit not null