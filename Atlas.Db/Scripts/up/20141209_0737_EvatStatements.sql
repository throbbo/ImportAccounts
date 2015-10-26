create table evat_statements
(
	evat_statement_id int not null identity primary key,
	client_id int not null CONSTRAINT fk_evat_statements_client_id REFERENCES clients(client_id),
	report_date datetime not null,
	file_name nvarchar(1000) not null
)