alter table messages add message_html nvarchar(max)
GO

update messages set message_html = message_text;
alter table messages alter column message_html nvarchar(max) not null
GO

EXEC sp_rename 'messages.email_subject', 'subject', 'COLUMN'
GO