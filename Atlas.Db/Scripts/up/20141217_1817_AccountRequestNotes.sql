create table account_request_notes
(
	account_request_note_id int not null identity primary key,
	account_request_id int not null CONSTRAINT fk_account_request_notes_account_request_id REFERENCES account_requests(account_request_id),
	added_by_user_id int not null CONSTRAINT fk_account_request_notes_added_by_user_id REFERENCES users(user_id),	
	date_added datetime not null,
	note nvarchar(max) not null
)