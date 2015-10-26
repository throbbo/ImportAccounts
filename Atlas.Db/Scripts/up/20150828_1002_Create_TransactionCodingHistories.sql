create table transaction_coding_histories
(
	transaction_coding_history_id int not null identity constraint pk__transaction_coding_histories primary key,
	updated_by_user_id int null constraint fk__transaction_coding_histories__user_id foreign key references users(user_id),
	transaction_id int not null constraint fk__transaction_coding_histories__transaction_id foreign key references transactions(transaction_id),
	date datetime not null,
	transaction_coding_model nvarchar(max) null
)