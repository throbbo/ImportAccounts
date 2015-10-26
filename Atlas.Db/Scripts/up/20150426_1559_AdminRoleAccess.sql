create table admin_role_access
(
	admin_role_id int not null,
	access_admin_role_id int not null,

	constraint pk__admin_role_access
		primary key (admin_role_id, access_admin_role_id),

	constraint fk__admin_role_access__admin_role_id 
		foreign key (admin_role_id) 
		references admin_roles(admin_role_id),

	constraint fk__admin_role_access__access_admin_role_id 
		foreign key (access_admin_role_id) 
		references admin_roles(admin_role_id)
)