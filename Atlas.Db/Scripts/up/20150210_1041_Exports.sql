create table exports (
    export_id int identity(1,1) not null primary key,
    billing_period_id int not null constraint fk_billing_periods_billing_period_id references billing_periods(billing_period_id),
    date_exported datetimeoffset not null,
    transactions_exported int not null
);

create table export_transactions (
    export_id int not null constraint fk_export_transactions_export_id references exports(export_id),
    transaction_id int not null constraint fk_export_transactions_transaction_id references transactions(transaction_id),
    constraint PK_export_transactions primary key (export_id, transaction_id)
);

create unique index udx_export_transactions on export_transactions(transaction_id);