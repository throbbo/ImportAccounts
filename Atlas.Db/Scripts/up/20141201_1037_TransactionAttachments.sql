create table transaction_attachments
(
	transaction_attachment_id int not null identity primary key,
	transaction_id int not null CONSTRAINT fk_transaction_attachments_transaction_id REFERENCES transactions(transaction_id),
	file_name nvarchar(1000) not null
)