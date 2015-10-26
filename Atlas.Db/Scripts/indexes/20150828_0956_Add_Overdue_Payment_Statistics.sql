IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__overdue_payment_statistics__account_statement_id' AND [object_id] = OBJECT_ID(N'overdue_payment_statistics'))
BEGIN
	create index ix__overdue_payment_statistics__account_statement_id on overdue_payment_statistics(account_statement_id)
END
go

