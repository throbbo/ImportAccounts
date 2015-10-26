create table historic_passwords (
	historic_password_id int identity not null primary key,
	user_id int not null,
	password varchar(100),
	password_last_modified datetime,
	foreign key (user_id) references users(user_id)
);