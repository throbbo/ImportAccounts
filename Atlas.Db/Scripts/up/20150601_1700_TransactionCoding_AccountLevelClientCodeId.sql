sp_RENAME 'transaction_codings.client_code_id' , 'transaction_level_client_code_id', 'COLUMN'
GO

alter table transaction_codings add account_level_client_code_id int null
	constraint fk_transaction_codings_account_level_client_code_id__client_codes_client_code_id foreign key references client_codes (client_code_id)
GO

alter table transaction_codings alter column transaction_level_client_code_id int null