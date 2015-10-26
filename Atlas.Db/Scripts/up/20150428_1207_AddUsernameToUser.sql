alter table users
add username nvarchar(50),
created_by int NULL FOREIGN KEY REFERENCES users(user_id),
is_internal_email bit NOT NULL DEFAULT(0);
go

IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__user_security_info__legacy_username' AND [object_id] = OBJECT_ID(N'user_security_info'))
begin
  drop index ix__user_security_info__legacy_username on user_security_info
end
go
--
alter table user_security_info
drop column legacy_username
go
