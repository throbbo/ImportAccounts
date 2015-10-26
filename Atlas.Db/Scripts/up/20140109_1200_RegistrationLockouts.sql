create table registration_lockouts (
	registration_lockout_id int identity not null primary key,
	ip_address nvarchar(50),
	lockout_timestamp datetime,
	failed_attempts int,	
);