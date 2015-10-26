create table company_import_settings
(
	company_identification nvarchar(100) primary key,
	should_import bit not null,
	should_send_emails bit not null
)