insert into admin_role_access (admin_role_id, access_admin_role_id)
select 1, 1 where not exists (select 1 from admin_role_access where admin_role_id = 1 and access_admin_role_id = 1)