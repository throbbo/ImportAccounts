create table bulk_upload_files
(
	bulk_upload_file_id int identity not null constraint pk__bulk_upload_files primary key,
	uploaded_by_user_id int not null constraint fk__bulk_upload_files__uploaded_by_user_id foreign key references users(user_id),
	date_created datetime not null
)