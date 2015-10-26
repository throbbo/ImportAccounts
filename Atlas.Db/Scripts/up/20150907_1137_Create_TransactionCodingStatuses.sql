create table transaction_coding_statuses
(
	transaction_coding_status nvarchar(255) not null constraint pk__transaction_coding_statuses primary key
)
go

insert into transaction_coding_statuses values 
	('New'),
	('AwaitingApproval'),
	('Coded'),
	('Queried'),
	('Approved'),
	('Exported')
go

alter table transaction_codings add constraint fk__transaction_codings__status foreign key (status) references transaction_coding_statuses(transaction_coding_status)
go