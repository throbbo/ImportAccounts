alter table account_balances add past_due_amount decimal(18, 4) null
alter table account_balances add last_payment_amount decimal(18, 4) null
alter table account_balances add last_payment_date date null
alter table account_balances add missing_data bit null
go

update account_balances set
	missing_data = 1,
	past_due_amount = 0,
	last_payment_amount = 0

update ab set
	missing_data = 0,
	past_due_amount = acs.past_due_amount,
	last_payment_amount = acs.last_payment_amount,
	last_payment_date = acs.last_payment_date
from account_balances ab
	inner join account_statements acs on ab.account_balance_id = acs.closing_account_balance_id
go

alter table account_balances alter column past_due_amount decimal(18, 4) not null
alter table account_balances alter column last_payment_amount decimal(18, 4) not null
alter table account_balances alter column missing_data bit not null
