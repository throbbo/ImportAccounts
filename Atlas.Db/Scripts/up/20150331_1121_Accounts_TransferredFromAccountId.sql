alter table accounts add transferred_from_account_id int null 
	constraint fk__transactions__transferred_from_account_id references accounts(account_id) 