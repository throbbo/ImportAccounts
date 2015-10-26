create table client_codes
(
	client_code_id int not null identity primary key,
	client_id int not null CONSTRAINT fk_client_codes_client_id REFERENCES clients(client_id),
	code nvarchar(200) not null,
	[description] nvarchar(255) not null,
	[type] nvarchar(50) not null,
	constraint ux_client_codes_client_id_type_code unique (client_id, [type], code)
)
