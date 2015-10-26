create table enhanced_transaction_projections(
	transaction_id int primary key not null FOREIGN KEY REFERENCES transactions(transaction_id), 
	projection nvarchar(max) not null
);
