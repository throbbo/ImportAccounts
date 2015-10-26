--drop table task_audits
create table user_task_audits
(
  user_task_audit_id int identity(1,1) primary key,
  target_type nvarchar(512) not null,
  target_id int not null foreign key references users(user_id),
  task nvarchar(512) not null,
  executed_at datetime not null
)
