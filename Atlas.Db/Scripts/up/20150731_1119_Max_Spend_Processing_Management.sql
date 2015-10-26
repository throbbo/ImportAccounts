if exists(select 1 from sysobjects where type = 'u' and name = 'spend_management_processing_ids')
	drop table spend_management_processing_ids
go
create table spend_management_processing_ids (
	spend_management_processing_id					int identity(1,1) primary key,
	fixed_start_processing_date						datetime not null,
	spend_by_day_max_processed_transaction_id		int,
	spend_by_period_max_processed_transaction_id	int)
go
if exists(select 1 from sysobjects where type = 'tr' and name = 'trg_del_spend_management_processing_ids')
	drop trigger trg_del_spend_management_processing_ids
go
create trigger trg_del_spend_management_processing_ids
	on spend_management_processing_ids 
	after delete
as
begin
	raiserror(N'Cannot delete rows from spend_management_processing_ids - must have 1 row and 1 row only', 10, 1)
	rollback
	return
end
go
if exists(select 1 from sysobjects where type = 'tr' and name = 'trg_ins_spend_management_processing_ids')
	drop trigger trg_ins_spend_management_processing_ids
go
create trigger trg_ins_spend_management_processing_ids
	on spend_management_processing_ids 
	after insert
as
begin
	if (select count(1) from spend_management_processing_ids) <> 1
	begin
		raiserror(N'Cannot insert rows into spend_management_processing_ids as already has 1 row', 10, 1)
		rollback
	end
	return
end
go
insert into spend_management_processing_ids (
	fixed_start_processing_date,
	spend_by_day_max_processed_transaction_id,
	spend_by_period_max_processed_transaction_id)
select '1900-01-01', 0,0
go
truncate table spend_by_period
go
truncate table spend_by_day
go

