create table account_request_histories (
	account_request_history_id int identity NOT NULL primary key,
	account_request_id int FOREIGN KEY REFERENCES account_requests(account_request_id),
	actioned_by int FOREIGN KEY REFERENCES users(user_id) NOT NULL,
	account_request_status nvarchar(50),
	actioned_date datetime	
);

alter table account_requests alter column account_request_type nvarchar(50);

alter table account_requests alter column account_request_status nvarchar(50);

alter table account_requests 
add CONSTRAINT fk_requested_by FOREIGN KEY (requested_by) REFERENCES users(user_id);

alter table account_requests 
add	last_actioned_by int FOREIGN KEY REFERENCES users(user_id) null,
	last_actioned_date datetime NULL
;	



