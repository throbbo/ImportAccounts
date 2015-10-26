alter table logon_attempts add ignored bit null
go
update logon_attempts set ignored = 0
alter table logon_attempts alter column ignored bit not null