alter table scheduled_reports add enabled bit null;
go
update scheduled_reports set enabled = 1;
alter table scheduled_reports alter column enabled bit not null;