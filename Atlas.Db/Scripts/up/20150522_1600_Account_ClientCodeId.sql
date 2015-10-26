alter table accounts add client_code_id int null
	constraint fk_accounts_client_code_id__client_codes_client_code_id foreign key references client_codes (client_code_id);
