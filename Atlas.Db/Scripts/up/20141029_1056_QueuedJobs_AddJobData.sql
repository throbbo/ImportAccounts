alter table queued_jobs add job_status int not null default(0);
alter table queued_jobs add job_data varchar(max) null;
alter table queued_jobs add exception_details varchar(max) null;
go
update queued_jobs set job_data = '';
update queued_jobs set exception_details = '';
update queued_jobs set job_status = 1 where completed = 1;
alter table queued_jobs alter column job_data varchar(max) not null;
alter table queued_jobs alter column exception_details varchar(max) not null;
alter table queued_jobs drop column completed;