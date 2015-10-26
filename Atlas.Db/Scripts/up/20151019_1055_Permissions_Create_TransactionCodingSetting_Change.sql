insert into permissions values ('TransactionCodingSetting_Change');
go

-- Insert where not "BA Sales & Account Management"
insert into admin_role_permissions
	select a.admin_role_id, 'TransactionCodingSetting_Change'
	from admin_roles a 
	where a.system_role = 2
		and a.admin_role_id not in (10, 11);
go

insert into user_permissions
	select u.user_id, null, 'TransactionCodingSetting_Change'
	from users u
	where u.system_role = 2
		and u.admin_role_id not in (10, 11);
go