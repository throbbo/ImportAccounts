
sp_rename 'transaction_type_categories.name', 'translation_key' , 'COLUMN'
go

update transaction_type_categories set debit_or_credit = 'Debit', translation_key = 'BANK_CHANGES' where transaction_type_category_id = 1;
update transaction_type_categories set debit_or_credit = 'Debit', translation_key = 'CASH_ADVANCES' where transaction_type_category_id = 2;
update transaction_type_categories set debit_or_credit = 'Debit', translation_key = 'INTEREST_CHARGES' where transaction_type_category_id = 3;
update transaction_type_categories set debit_or_credit = 'Debit', translation_key = 'LEDGER_TRANSACTION' where transaction_type_category_id = 4;

insert into transaction_type_categories (transaction_type_category_id, debit_or_credit, translation_key)
values 
(5,  'Debit',  'MEMO_ONLY'),
(6,  'Credit', 'NOT_APPLICABLE'),
(7,  'Credit', 'PAYMENTS'),
(8,  'Debit',  'PURCHASES'),
(9,  'Debit',  'TAXES'),
(10, 'Debit',  'UNKNOWN');

insert into transaction_types (transaction_type_id, card_scheme_id, name, transaction_type_category_id)
values 
(0,   1, 'Unknown', 6),
(455, 1, 'PSD Manual Payment', 7),
(456, 1, 'PSD Payment Reapplied', 7),
(299, 2, 'Credit Adjustment', 8);

if exists (select 1 from transaction_types where transaction_type_id = 530 and card_scheme_id = 2)
begin
    update transaction_types 
    set name = 'Financial Adjustment', 
        transaction_type_category_id = 1
    where transaction_type_id = 530 
    and card_scheme_id = 2
end
else
begin
    insert into transaction_types (transaction_type_id, card_scheme_id, name, transaction_type_category_id)
    values (530, 2, 'Financial Adjustment', 1);
end

update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 10 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 11 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 2 where transaction_type_id = 20 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 2 where transaction_type_id = 22 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 7 where transaction_type_id = 30 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 7 where transaction_type_id = 31 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 3 where transaction_type_id = 40 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 50 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 52 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 54 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 56 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 61 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 62 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 63 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 64 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 7 where transaction_type_id = 65 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 66 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 6 where transaction_type_id = 71 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 6 where transaction_type_id = 73 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 80 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 82 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 84 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 86 and card_scheme_id = 1;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 88 and card_scheme_id = 1;

update transaction_types set transaction_type_category_id = 8 where transaction_type_id =  0 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 2 where transaction_type_id =  1 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 2 where transaction_type_id = 12 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 17 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 18 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 19 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 8 where transaction_type_id = 20 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 7 where transaction_type_id = 28 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 1 where transaction_type_id = 29 and card_scheme_id = 2;
update transaction_types set transaction_type_category_id = 7 where transaction_type_id = 50 and card_scheme_id = 2;
