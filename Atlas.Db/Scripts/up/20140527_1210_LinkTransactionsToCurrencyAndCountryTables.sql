execute sp_rename 'iso_currency_codes.currency_iso_id', 'currency_iso_number', 'COLUMN'
execute sp_rename 'iso_currency_codes.currency_code', 'currency_iso_code', 'COLUMN'
execute sp_rename 'iso_currency_codes', 'currencies'
go
ALTER TABLE [transactions] ADD currency_iso_number int null FOREIGN KEY REFERENCES currencies(currency_iso_number)
ALTER TABLE [transactions] ADD source_currency_iso_number int null FOREIGN KEY REFERENCES currencies(currency_iso_number)
go
UPDATE [transactions] SET 
	source_currency_iso_number = (SELECT currency_iso_number FROM currencies iso WHERE source_currency_code = iso.currency_iso_code),
	currency_iso_number = (SELECT currency_iso_number FROM currencies iso WHERE currency_code = iso.currency_iso_code)
go
ALTER TABLE [transactions] ALTER COLUMN currency_iso_number int NOT NULL
ALTER TABLE [transactions] ALTER COLUMN source_currency_iso_number int NOT NULL
ALTER TABLE [transactions] DROP COLUMN currency_code
ALTER TABLE [transactions] DROP COLUMN source_currency_code
go
ALTER TABLE transaction_line_item_summaries ADD source_country_iso_number int null FOREIGN KEY REFERENCES countries(country_iso_number) 
ALTER TABLE transaction_line_item_summaries ADD destination_country_iso_number int null FOREIGN KEY REFERENCES countries(country_iso_number) 
go
UPDATE transaction_line_item_summaries SET 
	source_country_iso_number = (SELECT country_iso_number FROM countries WHERE source_country_iso_code = country_iso_alpha_3),
	destination_country_iso_number = (SELECT country_iso_number FROM countries WHERE destination_country_iso_code = country_iso_alpha_3 or country_name = destination_country)
go
ALTER TABLE transaction_line_item_summaries ALTER COLUMN destination_country_iso_number int NOT NULL
ALTER TABLE transaction_line_item_summaries DROP COLUMN destination_country_iso_code
ALTER TABLE transaction_line_item_summaries DROP COLUMN source_country_iso_code
go