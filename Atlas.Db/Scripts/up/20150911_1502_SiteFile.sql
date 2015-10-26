create table site_files (
	site_file_id int not null identity primary key,
    id uniqueidentifier not null,
	file_name nvarchar(255) not null,
	content_type nvarchar(255) not null,
    date_created datetime not null
)