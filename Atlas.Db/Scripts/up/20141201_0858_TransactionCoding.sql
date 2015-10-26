create table transaction_codings
(
	transaction_id int not null primary key CONSTRAINT fk_transaction_codings_transaction_id REFERENCES transactions(transaction_id),
	client_code_id int not null CONSTRAINT fk_transaction_codings_client_code_id REFERENCES client_codes(client_code_id),
	reason nvarchar(255) not null,
	[status] nvarchar(255) not null,
)