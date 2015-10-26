alter table transactions add acquiring_bin varchar(6) null;
go
update transactions set acquiring_bin = ''
alter table transactions alter column acquiring_bin varchar(6) not null;
