create table user_histories
(
	user_history_id int identity primary key,
	user_id int constraint pk_user_histories_user_id__users_user_id references users(user_id) not null,
	date DateTime not null,
	user_model nvarchar(max) null
)