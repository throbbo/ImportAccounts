alter table bulk_upload_card_applications add created_card_application_id int null 
	constraint fk__bulk_upload_card_applications__created_card_application_id foreign key references card_applications(card_application_id)