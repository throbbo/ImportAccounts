create table download_templates
(
	user_id int not null,
	name nvarchar(200) not null,
	field_names nvarchar(max) not null,
	template_type nvarchar(20) not null,
	constraint PK_download_templates primary key (user_id, name, template_type),
	CONSTRAINT fk__download_templates__user_id__users FOREIGN KEY (user_id) REFERENCES users(user_id),
)