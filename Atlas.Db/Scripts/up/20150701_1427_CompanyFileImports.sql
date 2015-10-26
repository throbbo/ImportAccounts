create table company_file_imports
(
	company_identification nvarchar(20) not null constraint pk_company_file_imports primary key,
	sequence_number int not null,
	expected_next_sequence_number int not null
)