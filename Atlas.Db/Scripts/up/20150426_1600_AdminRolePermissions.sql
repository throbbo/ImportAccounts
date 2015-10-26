create table admin_role_permissions
(
	admin_role_id int not null,
	permission nvarchar(255) not null,

	constraint pk__admin_role_permissions 
		primary key (admin_role_id, permission),

	constraint fk__admin_role_permissions__admin_role_id 
		foreign key (admin_role_id) 
		references admin_roles(admin_role_id),

	constraint fk__admin_role_permissions__permission 
		foreign key (permission) 
		references permissions(permission)
)