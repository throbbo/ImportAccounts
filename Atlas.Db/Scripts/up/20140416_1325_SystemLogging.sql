create table system_logs
(
	system_log_id int identity not null primary key,
	date datetime not null, 
	level nvarchar(25) not null,
	logger nvarchar(max) not null,
	message nvarchar(max) null,
	user_id nvarchar(10) null,
	url nvarchar(max) null,
	user_agent nvarchar(max) null,
	exception nvarchar(max) null,
	app_version nvarchar(50) not null
)