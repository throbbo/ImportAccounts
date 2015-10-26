create table client_message_templates
(
	client_message_template_id int not null identity constraint pk__client_message_templates primary key,
	client_id int not null 
		constraint fk__client_message_templates__client_id 
		foreign key references clients(client_id),
	name nvarchar(100) null,
	culture nvarchar(10) null,
	template_type nvarchar(10) null,
	body nvarchar(max) null,
	subject nvarchar(max) null
)
go
