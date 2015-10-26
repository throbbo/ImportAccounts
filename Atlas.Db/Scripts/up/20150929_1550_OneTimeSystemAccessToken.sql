create table one_time_system_access_tokens
(
	one_time_system_access_token_id int not null constraint pk__one_time_system_access_tokens primary key identity,
	access_token nvarchar(255),
	date_generated datetime not null,
	expiry_date datetime not null,
	date_used datetime null,
	command nvarchar(max) null
)