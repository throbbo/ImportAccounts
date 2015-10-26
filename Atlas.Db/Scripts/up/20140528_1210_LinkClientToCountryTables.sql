ALTER TABLE clients ADD country_iso_number int null FOREIGN KEY REFERENCES countries(country_iso_number) 
go
UPDATE clients SET country_iso_number = (SELECT country_iso_number FROM countries iso WHERE country = iso.country_name)
ALTER TABLE clients DROP COLUMN country