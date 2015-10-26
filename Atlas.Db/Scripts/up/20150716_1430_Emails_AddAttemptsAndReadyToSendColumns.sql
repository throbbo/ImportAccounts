alter table emails add attempts int null;
alter table emails add ready_to_send bit null;
go

update emails set attempts = 0, ready_to_send = 1

alter table emails alter column attempts int not null;
alter table emails alter column ready_to_send bit not null;