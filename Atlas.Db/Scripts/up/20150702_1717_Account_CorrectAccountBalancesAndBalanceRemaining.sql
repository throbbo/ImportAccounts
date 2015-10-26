update accounts 
set 
current_balance = 
(
	select top 1 ab.balance
	from account_balances ab
	where ab.account_id = accounts.account_id and ab.account_balance_type != 'Opening'
	order by [date] desc
),
balance_remaining = 
(
	select top 1 ab.balance_remaining
	from account_balances ab
	where ab.account_id = accounts.account_id and ab.account_balance_type != 'Opening'
	order by [date] desc
)