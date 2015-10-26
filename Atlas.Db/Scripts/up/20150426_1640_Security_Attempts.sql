alter table logon_attempts add method nvarchar(30) null
GO
update logon_attempts set method = 'UsernamePassword'
alter table logon_attempts alter column method nvarchar(30) not null