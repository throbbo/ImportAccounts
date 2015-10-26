alter table products add default_currency_iso_number int null references currencies(currency_iso_number);
go
update products set default_currency_iso_number = 826
alter table products alter column default_currency_iso_number int not null;