create table registration_attempts (
	registration_attempt_id int identity not null primary key,
	date datetime,
	email nvarchar(255),
	success bit,
	ip_address nvarchar(50),
	user_agent nvarchar(max)
);