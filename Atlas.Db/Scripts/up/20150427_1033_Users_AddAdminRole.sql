alter table users 
	add admin_role_id int null
		constraint fk__users__admin_role_id 
			foreign key (admin_role_id) 
			references admin_roles(admin_role_id)
go