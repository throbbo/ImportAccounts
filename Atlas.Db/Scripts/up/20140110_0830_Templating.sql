CREATE TABLE message_templates (
	message_template_id int not null primary key identity,
	name nvarchar(100),
	culture varchar(10),
	template_type nvarchar(10),
	body nvarchar(max)
)

