create table admin_roles
(
	admin_role_id int not null identity primary key,
	system_role int not null,
	name nvarchar(200) not null
)