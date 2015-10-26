create table account_holder_histories 
(	
	account_history_id int identity not null primary key,
	account_holder_id int not null CONSTRAINT fk__account_holders__account_holder_id FOREIGN KEY REFERENCES account_holders (account_holder_id),
	date datetime not null,
	account_holder_model nvarchar(max) null
)