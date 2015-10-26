create table evat_report_downloads (
		evat_report_download_id int primary key identity,
		evat_report_id int constraint fk_evat_report_downloads_evat_report_id__evat_reports_evat_report_id references evat_reports(evat_report_id) not null,
		user_id int constraint fk_evat_report_downloads_user_id__users_user_id references users(user_id) not null,
		ip_address nvarchar(50),
		date datetime
	)
