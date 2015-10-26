-- users
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__users_username' AND [object_id] = OBJECT_ID(N'users'))
BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [ix__users_username] ON [dbo].[users]
(
[username] ASC
)
WHERE ([username] IS NOT NULL AND [username] != '')
END
go

-- clients
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__clients__client_group_id' AND [object_id] = OBJECT_ID(N'clients'))
BEGIN
	CREATE INDEX ix__clients__client_group_id ON clients(client_group_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__clients__country_iso_number' AND [object_id] = OBJECT_ID(N'clients'))
BEGIN
	CREATE INDEX ix__clients__country_iso_number ON clients(country_iso_number)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__clients__company_identification' AND [object_id] = OBJECT_ID(N'clients'))
BEGIN
	CREATE INDEX ix__clients__company_identification ON clients(company_identification)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__clients__name' AND [object_id] = OBJECT_ID(N'clients'))
BEGIN
	CREATE INDEX ix__clients__name ON clients(name)
END
go

-- accounts
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__accounts__client_id' AND [object_id] = OBJECT_ID(N'accounts'))
BEGIN
	CREATE INDEX ix__accounts__client_id ON accounts(client_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__accounts__user_id' AND [object_id] = OBJECT_ID(N'accounts'))
BEGIN
	CREATE INDEX ix__accounts__user_id ON accounts(user_id)
END
go

-- account_requests
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_requests__requested_by' AND [object_id] = OBJECT_ID(N'account_requests'))
BEGIN
	CREATE INDEX ix__account_requests__requested_by ON account_requests(requested_by)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_requests__account_request_type' AND [object_id] = OBJECT_ID(N'account_requests'))
BEGIN
	CREATE INDEX ix__account_requests__account_request_type ON account_requests(account_request_type)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_requests__account_request_status' AND [object_id] = OBJECT_ID(N'account_requests'))
BEGIN
	CREATE INDEX ix__account_requests__account_request_status ON account_requests(account_request_status)
END
go

-- transactions
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__transactions__merchant_id' AND [object_id] = OBJECT_ID(N'transactions'))
BEGIN
	CREATE INDEX ix__transactions__merchant_id ON transactions(merchant_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__transactions__statement_date' AND [object_id] = OBJECT_ID(N'transactions'))
BEGIN
	CREATE INDEX ix__transactions__statement_date ON transactions(statement_date)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__transactions__transaction_date' AND [object_id] = OBJECT_ID(N'transactions'))
BEGIN
	CREATE INDEX ix__transactions__transaction_date ON transactions(transaction_date)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__transactions__account_id__transaction_date' AND [object_id] = OBJECT_ID(N'transactions'))
BEGIN
	CREATE NONCLUSTERED INDEX ix__transactions__account_id__transaction_date
		ON transactions(account_id, transaction_date)
		INCLUDE (billing_period_id, amount, transaction_type_id, card_scheme_id)
END
go

-- account_statements
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_statements__opening_account_balance_id' AND [object_id] = OBJECT_ID(N'account_statements'))
BEGIN
	CREATE INDEX ix__account_statements__opening_account_balance_id ON account_statements(opening_account_balance_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_statements__closing_account_balance_id' AND [object_id] = OBJECT_ID(N'account_statements'))
BEGIN
	CREATE INDEX ix__account_statements__closing_account_balance_id ON account_statements(closing_account_balance_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_statements__account_id' AND [object_id] = OBJECT_ID(N'account_statements'))
BEGIN
	CREATE INDEX ix__account_statements__account_id ON account_statements(account_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__account_statements__billing_period_id' AND [object_id] = OBJECT_ID(N'account_statements'))
BEGIN
	CREATE INDEX ix__account_statements__billing_period_id ON account_statements(billing_period_id)
END
go

-- user_widgets
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__user_widgets__user_id' AND [object_id] = OBJECT_ID(N'user_widgets'))
BEGIN
	CREATE INDEX ix__user_widgets__user_id ON user_widgets(user_id)
END
go

-- security_requests
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_requests__requested_by_user_id' AND [object_id] = OBJECT_ID(N'security_requests'))
BEGIN
	CREATE INDEX ix__security_requests__requested_by_user_id ON security_requests(requested_by_user_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_requests__last_actioned_by_user_id' AND [object_id] = OBJECT_ID(N'security_requests'))
BEGIN
	CREATE INDEX ix__security_requests__last_actioned_by_user_id ON security_requests(last_actioned_by_user_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_requests__client_group_id' AND [object_id] = OBJECT_ID(N'security_requests'))
BEGIN
	CREATE INDEX ix__security_requests__client_group_id ON security_requests(client_group_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_requests__applies_to_user_id' AND [object_id] = OBJECT_ID(N'security_requests'))
BEGIN
	CREATE INDEX ix__security_requests__applies_to_user_id ON security_requests(applies_to_user_id)
END

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_requests__client_id' AND [object_id] = OBJECT_ID(N'security_requests'))
BEGIN
	CREATE INDEX ix__security_requests__client_id ON security_requests(client_id)
END
go

-- security_request_histories
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_request_histories__security_request_id' AND [object_id] = OBJECT_ID(N'security_request_histories'))
BEGIN
	CREATE INDEX ix__security_request_histories__security_request_id ON security_request_histories(security_request_id)
END
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__security_request_histories__actioned_by_user_id' AND [object_id] = OBJECT_ID(N'security_request_histories'))
BEGIN
	CREATE INDEX ix__security_request_histories__actioned_by_user_id ON security_request_histories(actioned_by_user_id)
END
go

-- messages
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__messages__created_by_user_id' AND [object_id] = OBJECT_ID(N'messages'))
BEGIN
	CREATE INDEX ix__messages__created_by_user_id ON messages(created_by_user_id)
END
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__messages__approved_by_user_id' AND [object_id] = OBJECT_ID(N'messages'))
BEGIN
	CREATE INDEX ix__messages__approved_by_user_id ON messages(approved_by_user_id)
END
go

-- scheduled_reports
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__scheduled_reports__user_id' AND [object_id] = OBJECT_ID(N'scheduled_reports'))
BEGIN
	CREATE INDEX ix__scheduled_reports__user_id ON scheduled_reports(user_id)
END
go

-- currencies
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__currencies__currency_iso_code' AND [object_id] = OBJECT_ID(N'currencies'))
BEGIN
	CREATE INDEX ix__currencies__currency_iso_code ON currencies(currency_iso_code)
END
go

-- merchants
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__merchants__name' AND [object_id] = OBJECT_ID(N'merchants'))
BEGIN
	CREATE INDEX ix__merchants__name ON merchants(name)
END
go

-- merchant_categories
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__merchant_categories__name' AND [object_id] = OBJECT_ID(N'merchant_categories'))
BEGIN
	CREATE INDEX ix__merchant_categories__name ON merchant_categories(name)
END
go
