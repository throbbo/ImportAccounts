alter table card_schemes add create_pre_starter_records bit null;
go
update card_schemes set create_pre_starter_records = 1;
alter table card_schemes alter column create_pre_starter_records bit not null;