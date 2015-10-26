create table user_duplicates (
	original_user_id int not null,
	duplicate_user_id int not null,
	date_added datetime not null,
	constraint pk_user_duplicates primary key (original_user_id, duplicate_user_id),
	constraint fk_user_duplicates_original_user_id foreign key (original_user_id) references users(user_id),
	constraint fk_user_duplicates_duplicate_user_id foreign key (duplicate_user_id) references users(user_id)
);