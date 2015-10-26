alter table accounts add masked_transferred_from_account_number varchar(24) null;
alter table accounts add encrypted_transferred_from_account_number nvarchar(1000) null;
go
update accounts set masked_transferred_from_account_number = ''
update accounts set encrypted_transferred_from_account_number = ''
alter table accounts alter column masked_transferred_from_account_number varchar(24) not null;
alter table accounts alter column encrypted_transferred_from_account_number nvarchar(1000) not null;