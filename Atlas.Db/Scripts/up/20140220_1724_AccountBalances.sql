CREATE TABLE account_balances
(
	account_balance_id int NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	account_id int NOT NULL FOREIGN KEY REFERENCES accounts(account_id),
	billing_period_id int NOT NULL FOREIGN KEY REFERENCES billing_periods(billing_period_id),
	date date NOT NULL,
	balance numeric(16, 4) NOT NULL,
	is_closing_balance bit NOT NULL,	
	calculated bit NOT NULL,	
	date_added datetime NOT NULL
)