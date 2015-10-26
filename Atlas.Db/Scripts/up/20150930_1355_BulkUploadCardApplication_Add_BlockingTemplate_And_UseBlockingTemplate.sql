alter table bulk_upload_card_applications add use_blocking_template bit null;
alter table bulk_upload_card_applications add blocking_template int null 
	constraint fk__bulk_upload_card_applications foreign key references client_merchant_blocking_templates(client_merchant_blocking_template_id);
go

update bulk_upload_card_applications set use_blocking_template = 0 where use_blocking_template is null;
go

alter table bulk_upload_card_applications alter column use_blocking_template bit not null;
go