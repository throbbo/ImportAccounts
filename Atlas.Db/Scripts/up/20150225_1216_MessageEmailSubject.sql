alter table messages add email_subject nvarchar(50) null
go
update messages set email_subject = ''
alter table messages alter column email_subject nvarchar(50) not null