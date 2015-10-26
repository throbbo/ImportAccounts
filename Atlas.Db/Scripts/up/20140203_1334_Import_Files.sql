create table import_files
(
	import_file_id INT IDENTITY PRIMARY KEY,
	file_name nvarchar(1000) NOT NULL,
	file_checksum char(40) NOT NULL,
	company_identification nvarchar(20) NOT NULL,
	sequence_number numeric(10,0) NULL,
	start_date datetime NOT NULL,
	end_date datetime NULL,
	successfully_imported bit NOT NULL,
	error nvarchar(max) NOT NULL
)