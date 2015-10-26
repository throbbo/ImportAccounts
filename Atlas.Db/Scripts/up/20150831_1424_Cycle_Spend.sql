IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'spend_by_period_idx' AND [object_id] = OBJECT_ID(N'spend_by_period'))
BEGIN
    drop index spend_by_period.spend_by_period_idx
END
go

alter table spend_by_period
drop column balance
go

sp_rename 'spend_by_period.spend_cycle', 'cycle_spend'
go

update spend_management_processing_ids
set spend_by_period_max_processed_transaction_id = 0,
    spend_by_day_max_processed_transaction_id = 0;