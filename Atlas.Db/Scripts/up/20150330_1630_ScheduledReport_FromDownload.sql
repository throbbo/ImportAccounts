update scheduled_report_runs set scheduled_report_id = null;
delete scheduled_reports;

alter table scheduled_reports drop
    constraint fk__scheduled_reports_advanced_filter_template_id,
    constraint fk__scheduled_reports_download_template_id,
    column download_template_id,
    column advanced_filter_template_id
go

alter table scheduled_reports add 
	export_format nvarchar(8) not null,
    field_groups nvarchar(max) not null,
    query_model nvarchar(max) not null
