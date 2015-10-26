alter table system_dates alter column [date] date not null;
go

alter table system_dates add constraint pk__system_dates__date primary key ([date]);