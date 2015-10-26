create table client_merchant_blocking_templates (
	client_merchant_blocking_template_id int not null identity primary key,
	client_id int not null references clients(client_id),
	name nvarchar(255) not null,
	merchant_blocking_codes varchar(max) not null
)

