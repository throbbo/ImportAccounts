alter table account_snapshots add past_due_amount decimal(18, 4) null
alter table account_snapshots add last_payment_amount decimal(18, 4) null
alter table account_snapshots add last_payment_date date null
alter table account_snapshots add last_modified_date date null
alter table account_snapshots add delinquency_days int null
go

update account_snapshots set
	past_due_amount = coalesce(acs.past_due_amount, 0),
	last_payment_amount = coalesce(acs.last_payment_amount, 0),
	last_payment_date = acs.last_payment_date,
	last_modified_date = coalesce(acs.date, GETDATE()),
	delinquency_days = a.delinquency_days
from account_snapshots
	left join account_statements acs on account_snapshots.account_id = acs.account_id
	inner join accounts a on account_snapshots.account_id = a.account_id
where
	acs.account_statement_id is null or
	acs.account_statement_id = (select max(account_statement_id) from account_statements where account_id = account_snapshots.account_id)
go

alter table account_snapshots alter column past_due_amount decimal(18, 4) not null
alter table account_snapshots alter column last_payment_amount decimal(18, 4) not null
alter table accounts drop column delinquency_days