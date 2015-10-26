create table working_capital_by_day
(
	transaction_date date not null,
	client_id int not null 
		constraint fk__working_capital_by_day__client_id references clients(client_id),
	currency_iso_number int not null,
	transaction_count int not null,
	amount_total decimal(18,4) not null,
	constraint pk__working_capital_by_day 
		primary key clustered (transaction_date, client_id, currency_iso_number)
)