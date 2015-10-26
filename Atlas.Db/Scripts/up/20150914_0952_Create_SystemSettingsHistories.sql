create table system_settings_histories
(
	system_settings_history_id int not null constraint pk__system_settings_histories primary key identity,
	system_setting_id int not null constraint fk__system_settings_histories__system_setting_id foreign key references system_settings(system_setting_id),
	updated_by_user_id int null constraint fk__system_settings_histories__updated_by_user_id foreign key references users(user_id),
	date datetime not null,
	system_settings_model nvarchar(max) null
)