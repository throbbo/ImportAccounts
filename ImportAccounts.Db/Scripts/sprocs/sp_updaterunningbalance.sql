if exists(select 1 from sysobjects where name = 'sp_updaterunningbalance')
	drop procedure sp_updaterunningbalance 
go

-- Change this to only update new data instead of old data
-- For now this is fine.
create procedure sp_updaterunningbalance
as
begin
	delete runningbalance;

	insert into runningbalance (bankaccountid, transactionid, balancedate, amount, balance)
	select bankaccountid, -1*bankaccountid, openingbalancedate, openingbalance, openingbalance from bankaccounts;

	declare @table table (bankaccountid int, transactionid int, balancedate datetime, amount decimal(20,2)) 
	insert into @table (bankaccountid, transactionid, balancedate, amount)
	select b.bankaccountid, t.transactionid, t.transactiondate, creditamount - debitamount
	from transactions t
		inner join bankaccounts b on b.accountnumber = t.accountnumber
	order by b.bankaccountid, t.transactionid

	insert into runningbalance (bankaccountid, transactionid, balancedate, amount, balance)
	select t2.bankaccountid, t2.transactionid, t2.balancedate, amount, 
		ob.openingbalance 
				+ 
				coalesce((select sum(t.amount) from @table t 
				where t.bankaccountid = t2.bankaccountid 
				and t.balancedate < t2.balancedate ),0)
				+ 
				coalesce((select sum(t.amount) from @table t 
				where t.bankaccountid = t2.bankaccountid 
				and t.balancedate = t2.balancedate 
				and t.transactionid >= t2.transactionid),0) 

	from @table t2
		inner join bankaccounts ob on ob.bankaccountid = t2.bankaccountid
end
go
--sp_updaterunningbalance
--go
--select * from runningbalance order by bankaccountid, balancedate desc