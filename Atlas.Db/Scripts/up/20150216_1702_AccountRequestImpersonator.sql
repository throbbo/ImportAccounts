alter table account_requests 
	add requested_by_impersonator int null,
	CONSTRAINT fk__account_requests__requested_by_impersonator__users FOREIGN KEY (requested_by_impersonator) REFERENCES users(user_id);