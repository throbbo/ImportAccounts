alter table queued_import_files add company_identifier nvarchar(50) null
go
update queued_import_files set company_identifier = ''
alter table queued_import_files alter column company_identifier nvarchar(50) not null