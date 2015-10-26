alter table clients add fiscal_year_end date
go
update clients set fiscal_year_end = '1900-01-01'
alter table clients alter column fiscal_year_end date not null