alter table registration_lockouts add email nvarchar(255) null
go

update registration_lockouts set email = ''
alter table registration_lockouts alter column email nvarchar(255) not null
