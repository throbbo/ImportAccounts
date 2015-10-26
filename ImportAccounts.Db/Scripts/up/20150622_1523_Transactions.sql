create table transactions (
	transactionid int identity not null primary key,
	accountnumber nvarchar(30) not null,
	purchasedate datetime not null,
	narrative nvarchar(255) null,
	debitamount decimal(20,2) not null,
	creditamount decimal(20,2) not null,
	categories nvarchar(255) null,
	serial nvarchar(255) null
);

create index transaction_data_uidx on transactions (purchasedate)
;