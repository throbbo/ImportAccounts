ALTER TABLE [account_requests] ADD 
	requested_date datetime null default getutcdate(),
	follow_up_date date null,
	referred_date date null
go
