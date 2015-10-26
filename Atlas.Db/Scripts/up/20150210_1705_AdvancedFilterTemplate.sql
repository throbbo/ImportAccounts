create table advanced_filter_templates
(
	advanced_filter_template_id int not null identity primary key,
	user_id int not null,
	name nvarchar(200) not null,
	search_type nvarchar(20) not null,
	filters nvarchar(max) not null,
	CONSTRAINT ux_advanced_filter_templates__user_id__name__search_type unique (user_id, name, search_type), 
	CONSTRAINT fk__advanced_filter_templates__user_id__users FOREIGN KEY (user_id) REFERENCES users(user_id)
)