-- Having the check here because this file was renamed from a wrong date-format
IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'card_number_view_audits'))
BEGIN
    create table card_number_view_audits (
		card_number_view_audit_id int primary key identity,
		account_id int constraint fk_card_number_view_audits_account_id__accounts_account_id references accounts(account_id),
		user_id int constraint fk_card_number_view_audits_account_id__users_user_id references users(user_id),
		date datetime not null,
		url nvarchar(500)
	)
END

