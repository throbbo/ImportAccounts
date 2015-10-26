ALTER TABLE transactions ADD sequence_number nvarchar(100) null
go
update transactions set sequence_number = ''
ALTER TABLE transactions alter column sequence_number nvarchar(100) not null