CREATE TABLE account_statements
(
	account_statement_id int NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	opening_account_balance_id int NOT NULL FOREIGN KEY REFERENCES account_balances(account_balance_id),
	closing_account_balance_id int NOT NULL FOREIGN KEY REFERENCES account_balances(account_balance_id),
	account_id int NOT NULL FOREIGN KEY REFERENCES accounts(account_id),
	billing_period_id int NOT NULL FOREIGN KEY REFERENCES billing_periods(billing_period_id),
	date date NOT NULL,	
	payment_due_date date NULL,
	current_amount_due decimal(16,4) NOT NULL,
	cycles_overdue int NOT NULL,
	past_due_amount decimal(16,4) NOT NULL,
	disputed_amount decimal(16,4) NOT NULL,
	last_payment_amount decimal(16,4) NOT NULL,
	last_payment_date date NULL,
	high_balance decimal(16,4) NOT NULL,
)