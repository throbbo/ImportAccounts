ALTER TABLE countries ADD CONSTRAINT PK_country_iso_number PRIMARY KEY CLUSTERED (country_iso_number) 
ALTER TABLE merchants ADD country_iso_number int NULL FOREIGN KEY REFERENCES countries(country_iso_number)
go
UPDATE merchants SET country_iso_number = (SELECT country_iso_number FROM countries WHERE country_iso_alpha_3 = iso_country_code or country_name = iso_country_code)
ALTER TABLE merchants ALTER COLUMN country_iso_number int NOT NULL
ALTER TABLE merchants DROP COLUMN iso_country_code
