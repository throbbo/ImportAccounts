create table followers (
	user_id int FOREIGN KEY REFERENCES users(user_id),
	client_id int FOREIGN KEY REFERENCES clients(client_id),
	primary key (user_id, client_id)	
);


