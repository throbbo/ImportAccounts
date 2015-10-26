alter table accounts add atm_access bit null
go
update accounts set atm_access = 1
alter table accounts alter column atm_access bit not null