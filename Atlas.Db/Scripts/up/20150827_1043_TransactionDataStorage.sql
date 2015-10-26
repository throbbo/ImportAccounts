if not exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[transaction_data_storages]') and type in (N'U'))
begin

	create table transaction_data_storages
	(
		transaction_id int not null
			constraint pk__transaction_data_storage primary key
			constraint fk__transaction_data_storage__transaction_id foreign key references transactions(transaction_id),
		additional_data nvarchar(max) not null
	)

	insert into transaction_data_storages(transaction_id, additional_data)
		select transaction_id, additional_data from transactions

end

alter table transactions drop column additional_data