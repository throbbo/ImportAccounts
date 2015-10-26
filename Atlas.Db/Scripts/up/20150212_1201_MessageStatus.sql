alter table messages 
  add status nvarchar(50) null
go
update messages set status = 'Sent'
alter table messages
  alter column status nvarchar(50) not null