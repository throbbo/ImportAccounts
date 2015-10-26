if exists(select 1 from sysobjects where name = 'transactionreconciles')
	drop table transactionreconciles 
;
create table transactionreconciles (
	transactionreconcileid int identity not null primary key,
	transactionid int not null,
	category      nvarchar(30)  not null,  -- Expense, Revenue, Asset, 
	amount        decimal(20,2) not null,  -- Money in is positive, money out is negative
	gstType       nvarchar(10)  not null,  -- GST, GSTFREE, INPUTTAXED
	gst           decimal(20,2) not null,  -- Calcuated from Amount and Gst Type
	description   nvarchar(255) null,       -- Any notes
	reconciled    bit not null
);

create unique index transactionreconciles_uidx on transactionreconciles (transactionid)
;


if exists(select 1 from sysobjects where name = 'companies')
	drop table companies 
;
create table companies (
	companiesid int identity not null primary key,
	company	nvarchar(30) not null
)
;
insert into companies (company) select 'Goelearning Ptd Ltd'
;

if exists(select 1 from sysobjects where name = 'bankaccounts')
	drop table bankaccounts 
;
create table bankaccounts (
	bankaccountid int identity not null primary key,
	companyid int not null,
	accountnumber nvarchar(30) not null,
	openingbalance decimal(20,2) not null,  -- Money in is positive, money out is negative
	openingbalancedate datetime not null
);

create unique index bankaccounts_uidx on bankaccounts (accountnumber)
;

insert into bankaccounts(companyid, accountnumber, openingbalance, openingbalancedate)
select 1, '033039591953', 319.70, '2014-06-30'
;
insert into bankaccounts(companyid, accountnumber, openingbalance, openingbalancedate)
select 1, '033039591961', 1300.17, '2014-06-30'
;

if exists(select 1 from sysobjects where name = 'runningbalance')
	drop table runningbalance 
;
create table runningbalance (
	runningbalanceid int identity  not null primary key,
	bankaccountid	int            not null,
	transactionid	int            not null,
	balancedate		datetime	   not null,
	amount			decimal(20,2)  not null,  -- Money in is positive, money out is negative
	balance			decimal(20,2)  not null,  -- Money in is positive, money out is negative
);

create unique index runningbalance_uidx on runningbalance (bankaccountid, transactionid)
;
