alter table registration_attempts add masked_card_or_company_number nvarchar(16) null
go
update registration_attempts set masked_card_or_company_number = ''
alter table registration_attempts alter column masked_card_or_company_number nvarchar(16) not null