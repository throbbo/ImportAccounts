alter table accounts add latest_account_statement_id int null
	constraint fk__accounts__latest_account_statement_id references account_statements(account_statement_id)
go

update accounts set latest_account_statement_id =
(
    select top 1 acs.account_statement_id
    from account_statements acs
    where acs.account_id = accounts.account_id
    order by acs.date desc
)