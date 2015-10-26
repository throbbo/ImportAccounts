alter table products alter column settings nvarchar(max) null;
go

update products set settings = null where settings = '';
go