create table merchant_category_group_blocking_codes (
	account_id int not null references accounts(account_id),
	merchant_category_group_code int not null,
	card_scheme_id int not null,
	CONSTRAINT merchant_category_group_blocking_codes_merchant_category_group_fkey FOREIGN KEY (card_scheme_id,merchant_category_group_code) REFERENCES merchant_category_groups(card_scheme_id,merchant_category_group_code),
	CONSTRAINT merchant_category_group_blocking_codes_pkey PRIMARY KEY (account_id, merchant_category_group_code, card_scheme_id)
)

