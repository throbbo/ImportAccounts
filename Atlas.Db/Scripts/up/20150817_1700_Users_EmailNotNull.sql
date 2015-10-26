update users set email = '' where email is null;

IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__users__username__email' AND [object_id] = OBJECT_ID(N'users'))
BEGIN
	drop index ix__users__username__email on users
END
GO

alter table users
    alter column email nvarchar(255) not null;
