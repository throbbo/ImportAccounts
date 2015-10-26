create table users (
	user_id int identity not null primary key,
	client_id int not null,
	first_name nvarchar(255),
	last_name nvarchar(255),
	email nvarchar(255),
	mobile nvarchar(30),
	system_role int,
	status int,
	culture nvarchar(5) not null
);

create table user_security_info (
	user_id int not null primary key,
	password varchar(100),
	password_last_modified datetime,
	temporary_password varchar(100),
	temporary_password_last_modified datetime,
	security_number  nvarchar(12) null,
	security_number_last_modified datetime null,
	deactivated bit not null,
	registration_complete bit not null,
	foreign key (user_id) references users(user_id)
);