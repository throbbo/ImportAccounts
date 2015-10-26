create table documents (
	document_id int not null identity primary key,
	date_created datetime not null,
	file_name nvarchar(255) not null,	
	file_contents varbinary(max) not null,
	mime_type varchar(255) not null,
	anonymous_access bit not null
)