alter table accounts add currency_iso_number int null references currencies(currency_iso_number);
go
update accounts set currency_iso_number = (select p.default_currency_iso_number from products p where p.product_id = product_id)
alter table accounts alter column currency_iso_number int not null;