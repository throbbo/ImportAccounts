CREATE TABLE billing_periods (
	billing_period_id int identity NOT NULL PRIMARY KEY,
	client_id int NOT NULL FOREIGN KEY REFERENCES clients(client_id),
	card_scheme_id int NOT NULL FOREIGN KEY REFERENCES card_schemes(card_scheme_id),
	period int NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	period_complete bit NOT NULL
)
