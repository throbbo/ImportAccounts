create table queued_import_files
(
	queued_import_file_id int identity not null primary key,
	date_queued datetime not null,
	file_name nvarchar(1000) not null,
	file_size bigint not null,
	completed bit not null
)