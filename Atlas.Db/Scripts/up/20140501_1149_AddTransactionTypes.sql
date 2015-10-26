CREATE TABLE transaction_type_categories
(
	transaction_type_category_id int NOT NULL PRIMARY KEY,
	debit_or_credit nvarchar(10) NOT NULL,
	name nvarchar(50) NOT NULL
);

DROP TABLE transaction_types

CREATE TABLE transaction_types (
	transaction_type_id int NOT NULL PRIMARY KEY,
	card_scheme_id int NOT NULL FOREIGN KEY REFERENCES card_schemes(card_scheme_id),
	name nvarchar(50) NOT NULL,
	transaction_type_category_id int NOT NULL FOREIGN KEY REFERENCES transaction_type_categories(transaction_type_category_id)
);

ALTER TABLE transactions add transaction_type_id int NOT NULL FOREIGN KEY REFERENCES transaction_types(transaction_type_id)