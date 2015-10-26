
alter table user_security_info 
add
	temporary_security_number                 nvarchar(12) null,
	temporary_security_number_last_modified   datetime null
;
