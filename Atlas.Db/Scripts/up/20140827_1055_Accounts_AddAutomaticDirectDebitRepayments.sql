alter table accounts add automatic_direct_debit_repayments bit null;
go
update accounts set automatic_direct_debit_repayments = 0
alter table accounts alter column automatic_direct_debit_repayments bit not null;