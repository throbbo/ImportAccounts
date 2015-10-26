CREATE TABLE iso_currency_codes (
	currency_iso_id int NOT NULL PRIMARY KEY,
	currency_code nvarchar(3) NOT NULL,
	currency_name nvarchar(70) NOT NULL
)