alter table account_balances add balance_remaining decimal(18,4) null
GO
update ab 
	set balance_remaining = open_to_buy - (a.cycle_spending_limit * .1)
from account_balances ab
	inner join accounts a on ab.account_id = a.account_id
	
alter table account_balances drop column open_to_buy