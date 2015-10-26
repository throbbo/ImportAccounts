alter table messages add approved_by_user_id int null;
alter table messages add approved_date datetime null;
alter table messages add
	CONSTRAINT fk_messages_approved_by_user_id
	FOREIGN KEY (approved_by_user_id)
	REFERENCES users(user_id);