alter table [account_request_account_changes] add cycle_spending_limit numeric(16,4) null
go
update [account_request_account_changes] set cycle_spending_limit = credit_limit
alter table [account_request_account_changes] drop column credit_limit