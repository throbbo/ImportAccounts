alter table transactions add is_fraudulent bit null
go
update transactions set is_fraudulent = 0
alter table transactions alter column is_fraudulent bit not null