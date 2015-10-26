create table products
(
	product_id int identity primary key,
	name nvarchar(255) not null,
	settings nvarchar(max) not null
)

alter table products add constraint IX_Products_Name UNIQUE NONCLUSTERED(name);

insert into products(name, settings) values ('Default Product', '');