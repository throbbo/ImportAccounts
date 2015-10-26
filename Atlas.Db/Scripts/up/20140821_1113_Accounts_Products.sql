alter table accounts add product_id int null references products(product_id);
go
update accounts set product_id = (select cs.product_id from card_schemes cs where cs.card_scheme_id = accounts.card_scheme_id);
alter table accounts alter column product_id int not null;