alter table accounts add parent_account_id int null constraint FK_accounts_parent_account_id references accounts(account_id)
go
update accounts set parent_account_id = billing_account_id

declare @dropConstraint varchar(1000)

BEGIN TRY
	-- following is equivalent to: ALTER TABLE transactions DROP CONSTRAINT FK__transacti__trans__7849DB76
	select @dropConstraint = (SELECT distinct 'ALTER TABLE ' + TABLE_NAME + ' DROP CONSTRAINT ' + CONSTRAINT_NAME
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE CONSTRAINT_NAME like 'FK__accounts__billin__%'
		AND table_name = 'accounts')
		
	exec (@dropConstraint)
END TRY
BEGIN CATCH
END CATCH
go

alter table accounts drop column billing_account_id