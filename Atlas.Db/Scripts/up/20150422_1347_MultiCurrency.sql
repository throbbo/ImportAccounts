create table system_exchange_rates (
    system_exchange_rate_id int identity primary key,
    exchange_date date not null,
    from_currency_iso_number int not null constraint fk_currencies__from_currency_iso_number references currencies(currency_iso_number),
    to_currency_iso_number int not null constraint fk_currencies__to_currency_iso_number references currencies(currency_iso_number),
    rate decimal(18, 8) not null
)

alter table clients
    add consolidation_currency_iso_number int null