alter table products add euro_dd_upload_enabled bit null
go

update products set euro_dd_upload_enabled = 0 where euro_dd_upload_enabled is null
go

alter table products alter column euro_dd_upload_enabled bit not null
go