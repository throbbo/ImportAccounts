if not exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[account_snapshots]') and type in (N'U'))
begin

	create table account_snapshots
	(
		account_id int not null
			constraint pk__account_snapshots primary key
			constraint fk__account_snapshots__account_id foreign key references accounts(account_id),
		current_balance decimal(18, 4) null,
		balance_remaining decimal(18, 4) null,
		latest_account_statement_id int null
			constraint fk__account_snapshots__latest_account_statement_id foreign key references account_statements(account_statement_id)
	)

	insert into account_snapshots(account_id, current_balance, balance_remaining, latest_account_statement_id)
		select account_id, current_balance, balance_remaining, latest_account_statement_id from accounts

end

alter table accounts drop column current_balance
alter table accounts drop column balance_remaining

alter table accounts drop constraint fk__accounts__latest_account_statement_id
alter table accounts drop column latest_account_statement_id