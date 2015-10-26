 create table logon_attempts (
	logon_attempt_id int identity not null primary key,
	date datetimeoffset,
	email nvarchar(255),
	user_id int FOREIGN KEY REFERENCES users(user_id),
	success bit,
	message nvarchar(max),
	ip_address nvarchar(50),
	user_agent nvarchar(max)	
);