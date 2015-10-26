create table user_statuses
(
	user_status nvarchar(50) not null constraint pk__user_statuses primary key
)
go

insert into user_statuses values ('NotSet')
insert into user_statuses values ('Active')
insert into user_statuses values ('TemporarilyLocked')
insert into user_statuses values ('LockedOut')
insert into user_statuses values ('AwaitingActivation')
insert into user_statuses values ('Deactivated')
insert into user_statuses values ('Archived')

update users set previous_status = 0 where previous_status is null

alter table users alter column status nvarchar(50) not null
alter table users alter column previous_status nvarchar(50) not null
go

update users set status = 'NotSet' where status = '0'
update users set status = 'Active' where status = '1'
update users set status = 'TemporarilyLocked' where status = '2'
update users set status = 'LockedOut' where status = '3'
update users set status = 'AwaitingActivation' where status = '4'
update users set status = 'Deactivated' where status = '5'
update users set status = 'Archived' where status = '6'

update users set previous_status = 'NotSet' where previous_status = '0'
update users set previous_status = 'Active' where previous_status = '1'
update users set previous_status = 'TemporarilyLocked' where previous_status = '2'
update users set previous_status = 'LockedOut' where previous_status = '3'
update users set previous_status = 'AwaitingActivation' where previous_status = '4'
update users set previous_status = 'Deactivated' where previous_status = '5'
update users set previous_status = 'Archived' where previous_status = '6'
go

alter table users add constraint fk__user__status foreign key (status) references user_statuses(user_status)
alter table users add constraint fk__user__previous_status foreign key (status) references user_statuses(user_status)