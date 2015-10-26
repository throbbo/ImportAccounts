alter table users add primary_account_id int null;
alter table users add constraint fk__users__primary_account_id foreign key (primary_account_id) references accounts(account_id)