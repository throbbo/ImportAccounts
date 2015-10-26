alter table users add other_id nvarchar(50) null;
go
update users set other_id = ''
ALTER TABLE users alter column other_id nvarchar(50) not null;