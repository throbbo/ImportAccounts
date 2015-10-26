IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__logon_attempts__user_id__success' AND [object_id] = OBJECT_ID(N'logon_attempts'))
BEGIN
	CREATE INDEX ix__logon_attempts__user_id__success ON logon_attempts(user_id, success)
END