CREATE TABLE overdue_payment_statistics
(
	overdue_payment_statistic_id int NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	account_statement_id int NOT NULL FOREIGN KEY REFERENCES account_statements(account_statement_id),
	overdue_cycle int NOT NULL,
	occurances int NOT NULL,
	combined_amount decimal(16,4) NOT NULL, 
)