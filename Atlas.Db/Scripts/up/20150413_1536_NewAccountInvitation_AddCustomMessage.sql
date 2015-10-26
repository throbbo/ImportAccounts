IF NOT EXISTS(SELECT * FROM sys.columns WHERE [name] = N'custom_message' AND [object_id] = OBJECT_ID(N'new_account_invitations'))
BEGIN
    alter table new_account_invitations
		add custom_message nvarchar(400) null;
END
GO

update new_account_invitations set custom_message = '' where custom_message is null;

IF EXISTS(SELECT * FROM sys.columns WHERE [name] = N'custom_message' AND [object_id] = OBJECT_ID(N'new_account_invitations') AND is_nullable = 1)
BEGIN
	alter table new_account_invitations
		alter column custom_message nvarchar(400) not null;
END
GO

