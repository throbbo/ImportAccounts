alter table accounts add reference varchar(90) null;
go
update accounts set reference = '';
alter table accounts alter column reference varchar(90) not null;

create index ix_accounts_reference on accounts(reference);