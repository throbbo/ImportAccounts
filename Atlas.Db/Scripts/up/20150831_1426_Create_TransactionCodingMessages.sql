create table transaction_coding_messages
(
	transaction_coding_message_id int not null identity constraint pk__transaction_coding_messages primary key,
	transaction_id int not null constraint fk__transaction_coding_messages__transaction_id foreign key references transactions(transaction_id),
	from_user_id int not null constraint fk__transaction_coding_messages__user_id foreign key references users(user_id),
	message_type nvarchar(20) not null,
	date datetime not null,
	message nvarchar(max) null
)