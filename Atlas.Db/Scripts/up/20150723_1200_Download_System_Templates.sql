create table download_system_templates
(
	download_system_template_id int identity not null primary key,
	name nvarchar(200) not null,
	field_names nvarchar(max) not null,
	template_type nvarchar(20) not null,
	system_role int not null,
	created_by int not null,
	CONSTRAINT fk__download_templates__created_by__users FOREIGN KEY (created_by) REFERENCES users(user_id),
)

