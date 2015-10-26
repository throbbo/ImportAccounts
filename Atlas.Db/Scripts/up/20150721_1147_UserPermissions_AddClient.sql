-- create table with new structure
create table temp_user_permissions
(
	user_permission_id int not null identity primary key,
	user_id int not null constraint fk__users__user_id foreign key references users(user_id),
	client_id int null constraint fk__clients__client_id foreign key references clients(client_id),
	permission nvarchar(255) not null constraint fk__permissions_permission foreign key references permissions(permission)
);
go

-- create unique indexes
create unique index unq__user_permissions__user_id__client_id__permission on temp_user_permissions(user_id, client_id, permission) where client_id is not null;
go

create unique index unq__user_permissions__user_id__permission on temp_user_permissions(user_id, permission) where client_id is null;
go

-- copy permissions
insert into temp_user_permissions (user_id, client_id, permission) 
	select up.user_id, uc.client_id, up.permission 
	from user_permissions up
		inner join users u on u.user_id = up.user_id
		left join user_clients uc on uc.user_id = u.user_id and u.system_role = 4;
go

-- drop old table
drop table user_permissions;
go

-- rename new table to old table
exec sp_rename 'temp_user_permissions', 'user_permissions';
go
