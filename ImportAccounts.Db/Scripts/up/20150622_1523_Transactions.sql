if exists(select 1 from sysobjects where name = 'transactions')
	drop table transactions 
;
create table transactions (
	transactionid int identity not null primary key,
	accountnumber nvarchar(30) not null,
	transactiondate datetime not null,
	narrative nvarchar(255) null,
	debitamount decimal(20,2) not null,
	creditamount decimal(20,2) not null,
	categories nvarchar(255) null,
	serial nvarchar(255) null
);

create index transactions_date_idx on transactions (transactiondate)
;
create index transactions_actno_idx on transactions (accountnumber)
;