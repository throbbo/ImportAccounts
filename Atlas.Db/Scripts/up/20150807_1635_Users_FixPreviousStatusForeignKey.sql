alter table users drop constraint fk__user__previous_status
go
alter table users add constraint fk__users__previous_status foreign key (previous_status) references user_statuses(user_status)