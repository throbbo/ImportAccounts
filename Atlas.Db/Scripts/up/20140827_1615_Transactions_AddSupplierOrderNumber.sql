alter table transactions add supplier_order_number nvarchar(25) null;
go
update transactions set supplier_order_number = ''
alter table transactions alter column supplier_order_number nvarchar(25) not null;
