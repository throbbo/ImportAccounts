alter table card_applications add imported_account_id int null constraint fk_card_applications_imported_account_id references accounts(account_id);
alter table card_applications add imported_date datetime null;