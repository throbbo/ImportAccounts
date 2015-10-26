create table messages
(
	message_id int not null identity primary key,
	date_added datetime not null,
	message_text nvarchar(max) not null
)

create table user_messages
(
	user_id int not null constraint fk_user_messages_user_id references users(user_id),
	message_id int not null constraint fk_user_messages_message_id references messages(message_id),
	date_read datetime null,
	constraint PK_user_messages primary key (user_id, message_id)
)