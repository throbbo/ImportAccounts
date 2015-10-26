create table client_message_template_histories
(
	client_message_template_history_id int not null identity 
		constraint pk__client_message_template_histories primary key,
	updated_by_user_id int null 
		constraint fk__client_message_template_histories__updated_by_user_id 
		foreign key references users(user_id),
	client_message_template_id int not null 
		constraint fk__client_message_template_histories__client_message_template_id 
		foreign key references client_message_templates(client_message_template_id),
	date datetime not null,
	client_message_template_model nvarchar(max) null
)
go