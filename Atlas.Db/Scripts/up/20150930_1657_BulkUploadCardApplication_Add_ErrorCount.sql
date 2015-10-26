alter table bulk_upload_card_applications add error_count int null;
go

update bulk_upload_card_applications set error_count = 0 where error_count is null;
go

alter table bulk_upload_card_applications alter column error_count int not null;
go