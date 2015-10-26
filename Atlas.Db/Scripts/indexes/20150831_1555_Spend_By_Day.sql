IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__spend_by_day__month_no' AND [object_id] = OBJECT_ID(N'spend_by_day'))
BEGIN
    CREATE NONCLUSTERED INDEX ix__spend_by_day__month_no
    ON [dbo].[spend_by_day] ([month_no])
    INCLUDE ([spend_total],[month_start_date])
END
go

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__spend_by_day__week_no' AND [object_id] = OBJECT_ID(N'spend_by_day'))
BEGIN
    CREATE NONCLUSTERED INDEX ix__spend_by_day__week_no
    ON [dbo].[spend_by_day] ([week_no])
    INCLUDE ([spend_total],[week_start_date])
END
go

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__spend_by_day__day_no' AND [object_id] = OBJECT_ID(N'spend_by_day'))
BEGIN
    CREATE NONCLUSTERED INDEX ix__spend_by_day__day_no
    ON [dbo].[spend_by_day] ([day_no])
    INCLUDE ([spend_total],[day_start_date])
END
go
