create table queued_jobs (
	queued_job_id int identity primary key,
	job_type varchar(500) not null,
	queued_date datetime not null,
	start_date datetime null,
	end_date datetime null,
	completed bit not null
);


