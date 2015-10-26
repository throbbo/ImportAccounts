alter table users add reference varchar(90) null;
go
update users set reference = '';
alter table users alter column reference varchar(90) not null;

create index ix_users_reference on users(reference);