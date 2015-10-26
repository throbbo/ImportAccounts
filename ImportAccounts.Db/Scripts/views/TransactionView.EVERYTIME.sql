IF OBJECT_ID('dbo.TransactionView', 'V') IS NOT NULL
    DROP VIEW dbo.TransactionView
GO

CREATE VIEW [dbo].[TransactionView]
AS
	select b.bankaccountid, b.companyid, t.*, tr.category, tr.gst, tr.gstType, tr.description, tr.reconciled, tr.amount, rb.balance
	from transactions t
		left join transactionreconciles tr on t.transactionid = tr.transactionid
		inner join bankaccounts b on b.accountnumber = t.accountnumber
		inner join runningbalance rb on rb.bankaccountid = b.bankaccountid and  t.transactionid = rb.transactionid
go
--select * from transactionview v 
--where exists(
--select * from bankaccounts b where  b.companyid = 1 and b.Accountnumber = v.AccountNumber )