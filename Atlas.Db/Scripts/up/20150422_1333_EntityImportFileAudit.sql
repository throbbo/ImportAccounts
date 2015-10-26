create table entity_import_file_audits
(
	entity_import_file_audit_id int not null identity primary key,
	import_file_id int not null,
	entity_type nvarchar(30) not null,
	entity_id int not null,
	action nchar(1) not null,

	CONSTRAINT fk__entity_import_file_audit_import_file_id FOREIGN KEY (import_file_id) REFERENCES import_files(import_file_id)
)