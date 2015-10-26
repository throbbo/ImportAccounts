insert into permissions values ('Administrators_Approver')

insert into admin_role_permissions
select admin_role_id, 'Administrators_CreateAmend' from admin_roles where admin_role_id in (2, 4, 10)


insert into admin_role_permissions
select admin_role_id, 'Administrators_Approver' from admin_roles where admin_role_id in (3, 5, 11, 1)
