IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__users_username' AND [object_id] = OBJECT_ID(N'users'))
BEGIN
	drop index ix__users_username on users;
END
go

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__users__username__email' AND [object_id] = OBJECT_ID(N'users'))
BEGIN
	create unique index ix__users__username__email on users(username, email) 
		where username is not null
			and email <> ''
			and username <> '';
END
go

