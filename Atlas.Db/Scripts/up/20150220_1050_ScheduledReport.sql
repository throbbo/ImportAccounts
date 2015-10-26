create table scheduled_reports
(
	scheduled_report_id int not null identity primary key,
	user_id int not null,
	name nvarchar(200) not null,
	report_frequency nvarchar(40) not null,
	date_created datetime not null,
	run_report_immediately bit not null,
	download_template_type nvarchar(20) not null,
	download_template_id int not null,
	advanced_filter_template_id int not null,

	CONSTRAINT ux__scheduled_reports UNIQUE (user_id, name, download_template_type),
	CONSTRAINT fk__scheduled_reports_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk__scheduled_reports_download_template_id 
		FOREIGN KEY (download_template_id) 
		REFERENCES download_templates(download_template_id),
	CONSTRAINT fk__scheduled_reports_advanced_filter_template_id 
		FOREIGN KEY (advanced_filter_template_id) 
		REFERENCES advanced_filter_templates(advanced_filter_template_id)
)