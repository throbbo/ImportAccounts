create table security_request_details
(
	security_request_id int not null primary key 
		constraint fk__security_request_details__security_request_id 
		foreign key (security_request_id) 
		references security_requests(security_request_id),
	user_details_admin_role_id int null
		constraint fk__security_request_details__user_details_admin_role_id
		foreign key (user_details_admin_role_id)
		references admin_roles(admin_role_id)
)