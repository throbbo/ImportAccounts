-- create account request group table
create table account_request_groups
(
	account_request_group_id int not null primary key identity,
	account_request_id int
);

-- create groups for existing account requests
insert into account_request_groups (account_request_id) select account_request_id from account_requests;

-- update account requests to include group and account id
alter table account_requests add 
	account_id int null 
	constraint fk_account_requests_account_id 
		foreign key references accounts(account_id),
	account_request_group_id int null 
	constraint fk_account_requests_account_request_group_id 
		foreign key references account_request_groups(account_request_group_id);

go

-- update the group ids on the account request and set the account id to the first account
update ar
	set ar.account_id = ara.account_id, ar.account_request_group_id = arg.account_request_group_id
from account_requests ar
	left join account_request_groups arg on arg.account_request_id = ar.account_request_id
	left join (select min(ara.account_id) as account_id, ara.account_request_id from account_request_accounts ara group by ara.account_request_id) ara
		on ara.account_request_id = ar.account_request_id;

-- insert new account requests for missing accounts
insert into account_requests
select
	ar.requested_by, 
	ar.account_request_type, 
	ar.account_request_status,
	ar.requested_date,
	ar.follow_up_date,
	ar.referred_date,
	ar.last_actioned_by,
	ar.last_actioned_date,
	ar.notes,
	ar.reason,
	ar.scheduled_date,
	ar.requested_by_impersonator,
	ara.account_id,
	ar.account_request_group_id
from account_requests ar
	inner join account_request_accounts ara on ara.account_request_id = ar.account_request_id
	left join account_requests are on are.account_request_id = ara.account_request_id and are.account_id = ara.account_id
where are.account_request_id is null;

go

-- insert account request changes
insert into account_request_account_changes
select 
	arb.account_request_id,
	arc.transaction_limit,
	arc.atm_limit,
	arc.extra_data,
	arc.reversal_on,
	arc.cash_advance_limit,
	arc.from_date,
	arc.to_date,
	arc.destination,
	arc.reason,
	arc.mcg_blocking_codes,
	arc.mcc_blocking_codes,
	arc.cycle_spending_limit,
	arc.object_changes,
	arc.request_new_card
from account_request_account_changes arc
	left join account_requests ar on ar.account_request_id = arc.account_request_id
	inner join account_requests arb on arb.account_request_group_id = ar.account_request_group_id
	left join account_request_account_changes arcb on arcb.account_request_id = arb.account_request_id
where arcb.account_request_id is null;

go

-- drop account_request_accounts
drop table account_request_accounts;

alter table account_request_groups drop column account_request_id;
alter table account_requests alter column account_id int not null;
alter table account_requests alter column account_request_group_id int not null;
