update scheduled_report_frequencies set interval = 'statement_period' where scheduled_report_frequency = 'StatementPeriodCompleted';
alter table scheduled_reports add client_id int null constraint fk_scheduled_reports__client_id references clients(client_id);
