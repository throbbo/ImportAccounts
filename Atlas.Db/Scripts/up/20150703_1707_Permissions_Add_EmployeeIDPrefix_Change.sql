declare @PermissionName varchar(30);
set @PermissionName = 'EmployeeIDPrefix_Change';

insert into permissions values (@PermissionName);
insert into admin_role_permissions values (1, @PermissionName);
insert into user_permissions select user_id, @PermissionName from users where admin_role_id = 1;