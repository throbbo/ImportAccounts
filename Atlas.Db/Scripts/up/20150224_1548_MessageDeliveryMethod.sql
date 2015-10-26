alter table messages 
  add delivery_method nvarchar(50) null
go
update messages set delivery_method = 'Email'
alter table messages
  alter column delivery_method nvarchar(50) not null