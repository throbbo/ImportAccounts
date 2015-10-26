if exists(select * from sysobjects where name= 'security_users_and_proxies_view' and type='V')
	drop view security_users_and_proxies_view 
go
create view security_users_and_proxies_view as (	
	select uc2.user_id ca_user_id, uc1.user_id user_id
    from user_clients uc1
        inner join user_clients uc2 on uc1.client_id = uc2.client_id
    union
    select proxy_user_id, uc1.user_id
    from user_proxies
        inner join users u on user_proxies.user_id = u.user_id
        inner join user_clients uc1 on uc1.user_id = u.user_id
		inner join user_clients uc2 on uc1.client_id = uc2.client_id
)
go

if exists(select * from sysobjects where name= 'security_users_and_client_groups_view' and type='V')
	drop view security_users_and_client_groups_view 
go
create view security_users_and_client_groups_view as (	
	select distinct uc1.user_id, c1.client_group_id, coalesce(c2.client_id,u.primary_client_id) client_id
    from user_clients uc1
		inner join users u on u.user_id = uc1.user_id
		inner join clients c1 on c1.client_id = uc1.client_id
		left join clients c2 on c2.client_group_id = c1.client_group_id
)
go

if exists(select 1 from sysobjects where name = 'user_client_users_by_role_view')
	drop view user_client_users_by_role_view 
go
create view user_client_users_by_role_view as (
SELECT uc.client_id, 
		u.system_role, 
		Count(u.user_id) AS sum_all, 
		Sum(case system_role when 16 then 1 else 0 end) as sum_proxy,
		Sum(case system_role when 8 then 1 else 0 end)  as sum_user,
		Sum(case system_role when 4 then 1 else 0 end)  as sum_companyadmin,
		Sum(case system_role when 2 then 1 else 0 end)  as sum_bankadmin,
		Sum(case system_role when 1 then 1 else 0 end)  as sum_supportadmin
FROM   users u 
   INNER JOIN user_clients uc ON u.user_id = uc.user_id 
WHERE  u.status != 'Archived' 
GROUP  BY uc.client_id, u.system_role)
go

if exists(select * from sysobjects where name= 'security_users_by_common_client_view' and type='V')
	drop view security_users_by_common_client_view 
go
create view security_users_by_common_client_view as (	
	select uc1.user_id ca_user_id, uc2.user_id user_id, uc1.client_id
    from user_clients uc1
        inner join user_clients uc2 on uc1.client_id = uc2.client_id
)
go

if exists(select * from sysobjects where name= 'security_user_permissions_view' and type='V')
	drop view security_user_permissions_view 
go
create view security_user_permissions_view as (	
	select up.user_id sec_user_id, uc.user_id, up.permission
	from user_permissions up 
		inner join user_clients uc on uc.client_id = up.client_id
)
go
