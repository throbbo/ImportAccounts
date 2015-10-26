IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_balances__account_id__date' AND [object_id] = OBJECT_ID(N'account_balances'))
BEGIN
	CREATE INDEX ix__account_balances__account_id__date ON account_balances(account_id, date)
END
go