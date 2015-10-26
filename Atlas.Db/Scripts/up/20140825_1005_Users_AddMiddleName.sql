alter table users add middle_name nvarchar(50) null;
go
update users set middle_name = ''
ALTER TABLE users alter column middle_name nvarchar(50) not null;