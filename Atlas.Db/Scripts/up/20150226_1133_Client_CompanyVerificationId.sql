alter table clients add company_verification_id nvarchar(26) null
go
update clients set company_verification_id = ''
alter table clients alter column company_verification_id nvarchar(26) not null