create table user_files (
	user_file_id int not null identity primary key,
	user_id int not null constraint fk_user_files__user_id references users(user_id),
	file_name nvarchar(255) not null,
	content_type nvarchar(255) not null
)

alter table scheduled_report_runs
	add user_file_id int null constraint fs_scheduled_report_runs__user_file_id references user_files(user_file_id)

