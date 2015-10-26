alter table card_schemes add ignore_sequencing bit null;
go
update card_schemes set ignore_sequencing = 0;
alter table card_schemes alter column ignore_sequencing bit not null;