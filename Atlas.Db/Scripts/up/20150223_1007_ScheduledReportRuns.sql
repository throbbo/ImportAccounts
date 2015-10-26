create table scheduled_report_runs ( 
	scheduled_report_run_id int not null identity primary key,
	scheduled_report_id int not null constraint fk_scheduled_report_runs_scheduled_report_id references scheduled_reports(scheduled_report_id),
	run_date datetime not null
)

create table scheduled_report_frequencies (
	scheduled_report_frequency nvarchar(40) not null primary key,
	interval nvarchar(25) not null,
	interval_multiplier int not null
)
go

insert into scheduled_report_frequencies(scheduled_report_frequency, interval, interval_multiplier) values ('Daily', 'day', 1)
insert into scheduled_report_frequencies(scheduled_report_frequency, interval, interval_multiplier) values ('Weekly', 'week', 1)
insert into scheduled_report_frequencies(scheduled_report_frequency, interval, interval_multiplier) values ('Fortnightly', 'week', 2)
insert into scheduled_report_frequencies(scheduled_report_frequency, interval, interval_multiplier) values ('Monthly', 'month', 1)
insert into scheduled_report_frequencies(scheduled_report_frequency, interval, interval_multiplier) values ('Quarterly', 'quarter', 1)
insert into scheduled_report_frequencies(scheduled_report_frequency, interval, interval_multiplier) values ('StatementPeriodCompleted', '', 1)
go

alter table scheduled_reports add constraint fk_scheduled_reports_report_frequency foreign key (report_frequency) references scheduled_report_frequencies(scheduled_report_frequency)