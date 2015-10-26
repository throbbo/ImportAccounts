alter table accounts add current_balance decimal(18,4) null
alter table accounts add balance_remaining decimal(18,4) null
GO

update a
set 
   current_balance = ab.balance,
   balance_remaining = ab.open_to_buy - (cycle_spending_limit * .1)
from accounts a
inner join account_balances ab on a.account_id = ab.account_id
where ab.account_balance_id in 
(
    select top 1 ab.account_balance_id
    from account_balances ab
    where ab.account_id = a.account_id
    order by ab.date desc
)