IF EXISTS(SELECT * FROM sys.databases where name = DB_NAME() and snapshot_isolation_state = 0)
BEGIN
    declare @snapshotIsolation nvarchar(1000) = N'ALTER DATABASE ' + QUOTENAME(DB_NAME()) + ' SET ALLOW_SNAPSHOT_ISOLATION ON'
    exec sp_executesql @snapshotIsolation
END
go

IF EXISTS(SELECT * FROM sys.databases where name = DB_NAME() and is_read_committed_snapshot_on = 0)
BEGIN
    declare @readCommitted nvarchar(1000) = N'ALTER DATABASE ' + QUOTENAME(DB_NAME()) + ' SET READ_COMMITTED_SNAPSHOT ON'
    exec sp_executesql @readCommitted
END
go

IF EXISTS(SELECT * FROM sys.configurations WHERE name = 'clr enabled' and value = 0)
BEGIN
    exec sp_configure 'clr enabled', 1;
END
go

IF EXISTS(SELECT * FROM sys.configurations WHERE name = 'clr enabled' and value = 1 and value_in_use = 0)
BEGIN
    reconfigure
END
go
