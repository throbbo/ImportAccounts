EXEC sp_rename 'account_request_account_changes.card_replacement_reason', 'reason', 'COLUMN'
GO

ALTER TABLE account_request_account_changes 
	ALTER COLUMN reason nvarchar(255)
GO
