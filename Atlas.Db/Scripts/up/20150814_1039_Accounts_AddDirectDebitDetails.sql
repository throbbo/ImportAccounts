alter table accounts add unique_mandate_reference nvarchar(50) null
alter table accounts add bank_sort_code nvarchar(20) null
alter table accounts add bank_account_number nvarchar(50) null
alter table accounts add creditor_id nvarchar(50) null
alter table accounts add dormant_account bit null
go

update accounts set
	unique_mandate_reference = '',
	bank_sort_code = '',
	bank_account_number = '',
	creditor_id = '',
	dormant_account = 0

alter table accounts alter column unique_mandate_reference nvarchar(50) not null
alter table accounts alter column bank_sort_code nvarchar(20) not null
alter table accounts alter column bank_account_number nvarchar(50) not null
alter table accounts alter column creditor_id nvarchar(50) not null
alter table accounts alter column dormant_account bit not null