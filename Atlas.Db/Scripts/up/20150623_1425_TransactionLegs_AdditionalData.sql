alter table transaction_legs add additional_data nvarchar(max) null
go
update transaction_legs set additional_data = ''
alter table transaction_legs alter column additional_data nvarchar(max) not null