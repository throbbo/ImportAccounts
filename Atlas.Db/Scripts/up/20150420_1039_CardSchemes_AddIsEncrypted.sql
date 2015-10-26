alter table card_schemes add is_encrypted bit null
go
update card_schemes set is_encrypted = 0
alter table card_schemes alter column is_encrypted bit not null