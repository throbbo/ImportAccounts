alter table company_file_imports add alternate_sequence_number int null
go
update company_file_imports set alternate_sequence_number = 0
alter table company_file_imports alter column alternate_sequence_number int not null