IF NOT EXISTS(SELECT * FROM sys.columns WHERE [name] = N'user_id' AND [object_id] = OBJECT_ID(N'scheduled_report_runs'))
BEGIN
    alter table scheduled_report_runs
        add user_id int null constraint fs_scheduled_report_runs__user_id references users(user_id)
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE [name] = N'report_name' AND [object_id] = OBJECT_ID(N'scheduled_report_runs'))
BEGIN
    alter table scheduled_report_runs
        add report_name nvarchar(400) null
END   
GO

IF EXISTS(SELECT * FROM sys.columns WHERE [name] = N'report_name' AND [object_id] = OBJECT_ID(N'scheduled_report_runs') AND is_nullable = 1)
BEGIN
    update scheduled_report_runs set report_name = ''
END   
GO

alter table scheduled_report_runs
    alter column report_name nvarchar(400) not null
go

alter table scheduled_report_runs
    alter column scheduled_report_id int null
go