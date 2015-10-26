create table user_settings (
	user_id int not null primary key FOREIGN KEY REFERENCES users(user_id),
	settings nvarchar(max)
);
	


