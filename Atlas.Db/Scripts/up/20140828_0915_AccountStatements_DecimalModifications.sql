alter table account_statements alter column credit_limit decimal(18,4) not null;
alter table account_statements alter column past_due_amount decimal(18,4) not null;
alter table account_statements alter column disputed_amount decimal(18,4) not null;
alter table account_statements alter column high_balance decimal(18,4) not null;
alter table account_statements alter column last_payment_amount decimal(18,4) not null;
alter table account_statements alter column current_amount_due decimal(18,4) not null;