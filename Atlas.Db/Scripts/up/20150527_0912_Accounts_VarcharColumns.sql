alter table accounts alter column masked_card_number nvarchar(24) null;
alter table accounts alter column account_status nvarchar(20) null;
alter table accounts alter column account_status_reason nvarchar(50) null;