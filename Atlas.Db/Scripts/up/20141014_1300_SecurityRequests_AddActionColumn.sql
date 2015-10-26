alter table security_requests 
add security_request_change_type nvarchar(50) null, 
	client_group_id int null,
	CONSTRAINT fk__security_requests__client_groups FOREIGN KEY (client_group_id) REFERENCES client_groups(client_group_id)
go

update security_requests set security_request_change_type = 'Updated'

alter table security_requests alter column security_request_change_type nvarchar(50) not null
