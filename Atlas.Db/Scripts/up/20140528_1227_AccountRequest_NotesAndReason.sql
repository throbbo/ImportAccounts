ALTER TABLE [account_requests] ADD 
	notes nvarchar(max),
	reason nvarchar(1000)
go
ALTER TABLE [account_requests] ALTER COLUMN referred_date datetime null
go