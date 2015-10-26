alter table card_schemes add product_id int null references products(product_id);
go
update card_schemes set product_id = (select top 1 product_id from products order by product_id);
alter table card_schemes alter column product_id int not null;