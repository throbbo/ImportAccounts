alter table accounts alter column transaction_spending_limit decimal(18,4) not null;
alter table accounts alter column cycle_spending_limit decimal(18,4) not null;
alter table accounts alter column atm_limit decimal(18,4) not null;
alter table accounts alter column credit_limit decimal(18,4) not null;
alter table accounts drop column cycle_limit;