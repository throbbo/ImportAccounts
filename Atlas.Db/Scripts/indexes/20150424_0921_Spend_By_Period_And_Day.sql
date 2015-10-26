IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'spend_by_period_idx' AND [object_id] = OBJECT_ID(N'spend_by_period'))
BEGIN
    create index spend_by_period_idx on spend_by_period (client_id,billing_period_id)
        include (cycle_spending_limit, cycle_spend, total_facility_limit)
END
go

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'spend_by_day_idx' AND [object_id] = OBJECT_ID(N'spend_by_day'))
BEGIN
    create unique index spend_by_day_idx on spend_by_day (client_id, day_start_date)
        include (week_no, month_no, transaction_count, spend_total)
END
go