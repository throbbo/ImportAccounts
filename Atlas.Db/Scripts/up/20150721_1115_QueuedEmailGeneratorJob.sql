create table queued_email_generator_jobs
(
    queued_email_generator_job_id int identity not null primary key,
    date_added datetime not null,
	date_generated datetime null,
	command_name nvarchar(255) not null,
	command_model nvarchar(max) not null
)