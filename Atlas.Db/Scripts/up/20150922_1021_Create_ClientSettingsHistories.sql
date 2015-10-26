create table client_settings_histories
(
	client_settings_history_id int not null constraint pk__client_settings_histories primary key identity,
	client_id int not null constraint fk__client_settings_histories__client_id foreign key references client_settings(client_id),
	updated_by_user_id int null constraint fk__client_settings_histories__updated_by_user_id foreign key references users(user_id),
	date datetime not null,
	client_settings_model nvarchar(max) null
)