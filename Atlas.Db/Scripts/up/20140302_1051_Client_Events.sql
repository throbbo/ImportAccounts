create table client_events (
	client_event_id 	int identity not null primary key,
	client_id 			int not null FOREIGN KEY REFERENCES clients (client_id),
	user_id 			int null FOREIGN KEY REFERENCES users (user_id),
	account_id 			int null FOREIGN KEY REFERENCES accounts(account_id),
	event_date 			date not null ,
	event_type 			nvarchar(50) not null ,
	details 			nvarchar(max) null
);
