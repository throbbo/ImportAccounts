create table job_logs (
	job_log_id int identity not null primary key,
	job_type varchar(max) not null,
	machine_name varchar(255) not null,
	date_started datetime not null,
	date_finished datetime null,
	error_occurred bit not null,
	exception_details varchar(max) not null,
	execution_skipped bit not null
);