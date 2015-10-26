create table account_histories (
	account_history_id 	int identity not null primary key,
	account_id 			int not null FOREIGN KEY REFERENCES accounts (account_id),
	date				datetime not null,
	account_model	 	nvarchar(max) null
);
