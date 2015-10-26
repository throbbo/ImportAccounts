update account_requests	set
	account_request_type = 'AccountApplicationInvitation'
where
	account_request_type = 'AccountApplication' and
	account_request_status = 'Draft'