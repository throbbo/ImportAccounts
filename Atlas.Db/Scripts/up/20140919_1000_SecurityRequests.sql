CREATE TABLE security_requests
(
  security_request_id int identity NOT NULL primary key,
  requested_by_user_id int NOT NULL,
  security_request_type nvarchar(50) NULL,
  security_request_status nvarchar(50) NULL,
  requested_date datetime NOT NULL default getutcdate(),
  last_actioned_by_user_id int NULL,
  last_actioned_date datetime NULL,
  notes nvarchar(max) NULL,
  reason nvarchar(1000) NULL,
  CONSTRAINT fk__security_requests__requested_by__users FOREIGN KEY (requested_by_user_id) REFERENCES users(user_id),
  CONSTRAINT fk__security_requests__last_actioned_by__users FOREIGN KEY (last_actioned_by_user_id) REFERENCES users(user_id)
);

create table security_request_histories
(
	security_request_history_id int identity NOT NULL primary key,
	security_request_id int NOT NULL,
	actioned_by_user_id int NOT NULL,
	security_request_status nvarchar(50),
	actioned_date datetime NOT NULL default getutcdate(),
	CONSTRAINT fk__security_request_histories__security_requests FOREIGN KEY (security_request_id) REFERENCES security_requests(security_request_id),
	CONSTRAINT fk__security_request_histories__actioned_by__users FOREIGN KEY (actioned_by_user_id) REFERENCES users(user_id)
);