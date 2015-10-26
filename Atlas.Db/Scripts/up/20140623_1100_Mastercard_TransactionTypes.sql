declare @dropConstraint varchar(1000)

BEGIN TRY
	-- following is equivalent to: ALTER TABLE transactions DROP CONSTRAINT FK__transacti__trans__7849DB76
	select @dropConstraint = (SELECT distinct 'ALTER TABLE ' + TABLE_NAME + ' DROP CONSTRAINT ' + CONSTRAINT_NAME
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE CONSTRAINT_NAME like 'FK__transacti__trans__%'
		AND table_name = 'transactions')
		
	exec (@dropConstraint)
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
	-- following is equivalent to: ALTER TABLE transaction_types DROP CONSTRAINT PK__transact__439ABFC174794A92
	select @dropConstraint = (SELECT distinct 'ALTER TABLE ' + TABLE_NAME + ' DROP CONSTRAINT ' + CONSTRAINT_NAME
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1
		AND table_name = 'transaction_types')
		
	exec (@dropConstraint)
END TRY
BEGIN CATCH
END CATCH

ALTER TABLE transaction_types ADD CONSTRAINT PK__transaction_types PRIMARY KEY (transaction_type_id, card_scheme_id)
ALTER TABLE transactions ADD card_scheme_id int not null default (1)
ALTER TABLE transactions ADD CONSTRAINT FK_transactions_transactions_types FOREIGN KEY (transaction_type_id, card_scheme_id) REFERENCES transaction_types(transaction_type_id, card_scheme_id)

-- insert into transaction_type_categories(transaction_type_category_id, debit_or_credit, name) values (, '', '')
-- insert into transaction_type_categories(transaction_type_category_id, debit_or_credit, name) values (, '', '')

insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (00, 2, 'Purchase', 3)

-- HACK need correct categories
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (01, 2, 'ATM Cash Withdrawal', 3) --//3
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (12, 2, 'Cash Disbursement', 1) --//1
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (17, 2, 'Convenience Check', 3) --//3

insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (18, 2, 'Unique Transaction', 3)
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (19, 2, 'Fee Collection', 4)
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (20, 2, 'Credit Purchase Return', 2)
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (28, 2, 'Payment', 1)
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (29, 2, 'Fee Collection', 4)
insert into transaction_types(transaction_type_id, card_scheme_id, name, transaction_type_category_id) values (50, 2, 'Payment / Balance transfer', 1)