alter table user_security_info add legacy_username nvarchar(50) null
go
update user_security_info set legacy_username = ''
alter table user_security_info alter column legacy_username nvarchar(50) not null