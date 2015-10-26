CREATE TABLE transaction_types (
	transaction_type_code_id int NOT NULL PRIMARY KEY,
	card_scheme_id int NOT NULL,
	transaction_type nvarchar(50) NOT NULL
);

CREATE TABLE dispute_reason_codes (
	dispute_reason_code_id int NOT NULL,
	card_scheme_id int NOT NULL,
	dispute_reason nvarchar(50) NOT NULL
);

ALTER TABLE dispute_reason_codes ADD CONSTRAINT PK_dispute_reason_codes PRIMARY KEY (dispute_reason_code_id, card_scheme_id);
ALTER TABLE dispute_reason_codes ADD CONSTRAINT FK_dispute_reason_codes_card_schemes FOREIGN KEY (card_scheme_id) REFERENCES card_schemes(card_scheme_id);

CREATE TABLE transactions (
	transaction_id int identity NOT NULL PRIMARY KEY,
	account_id int NOT NULL FOREIGN KEY	REFERENCES accounts(account_id),
	posting_applied date NOT NULL,
	transaction_date date NOT NULL,
	statement_date date NULL,
	reference_number nvarchar(24) NOT NULL,
	billing_period_id int NOT NULL FOREIGN KEY REFERENCES billing_periods(billing_period_id),
	merchant_id int NOT NULL FOREIGN KEY REFERENCES merchants(merchant_id),
	source_amount numeric(16, 4) NOT NULL,
	source_currency_code nvarchar(3) NOT NULL,
	amount numeric(16, 4) NOT NULL,
	tax_amount numeric(16, 4) NOT NULL,
	currency_code nvarchar(3) NOT NULL,
	customer_vat_number nvarchar(14) NOT NULL,
	commodity_code nvarchar(4) NOT NULL
);

CREATE NONCLUSTERED INDEX idx_transactions_account ON transactions (account_id)
	INCLUDE (billing_period_id,amount)
;

CREATE TABLE transaction_disputes (
	transaction_id int NOT NULL PRIMARY KEY,
	amount numeric(16, 4) NOT NULL,
	date date NOT NULL,
	reason nvarchar(50) NOT NULL,
	status nvarchar(2) NOT NULL
);

ALTER TABLE transaction_disputes ADD CONSTRAINT	FK_transaction_disputes_transactions FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id);

CREATE NONCLUSTERED INDEX transactions_billing_period_id_idx ON transactions (billing_period_id);
