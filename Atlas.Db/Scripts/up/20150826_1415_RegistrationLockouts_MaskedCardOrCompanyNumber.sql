alter table registration_lockouts add masked_card_or_company_number nvarchar(16) null
go
update registration_lockouts set masked_card_or_company_number = ''
alter table registration_lockouts alter column masked_card_or_company_number nvarchar(16) not null