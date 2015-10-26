alter table scheduled_reports add archived bit null
go
update scheduled_reports set archived = 0

alter table scheduled_reports alter column archived bit not null