set IDENTITY_INSERT admin_roles on
go

insert into admin_roles (admin_role_id, system_role, name) values
	(1, 2, 'BA Super User'),
	(2, 2, 'BA Ops'),
	(3, 2, 'BA Ops Approvers'),
	(4, 2, 'BA Direct'),
	(5, 2, 'BA Direct Approvers'),
	(6, 2, 'BA Global Resources'),
	(7, 2, 'BA Global Resources Auditors'),
	(8, 2, 'BA System Admin'),
	(9, 2, 'BA System Admin Approvers'),
	(10, 2, 'BA Sales & Account Management'),
	(11, 2, 'BA Sales & Account Management Approvers')
go

set IDENTITY_INSERT admin_roles off
go

insert into admin_role_access (admin_role_id, access_admin_role_id) values
	-- BA Super User
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),

	-- BA System Admin
	(8, 2),
	(8, 3),
	(8, 4),
	(8, 5),
	(8, 6),
	(8, 7),

	-- Roles to themselves
	(2, 2), -- BA Ops
	(4, 4), -- BA Direct
	(8, 8), -- BA System Admin
	(10, 10), -- BA Sales & Account Management

	-- Approver roles
	(3, 2), -- BA Ops Approver
	(5, 4), -- BA Direct Approver
	(9, 8), -- BA System Admin Approver
	(11, 10) -- BA Sales & Account Management Approver
go

-- BA Super User
insert into admin_role_permissions (admin_role_id, permission) select 1 as admin_role_id, permission from permissions
go

-- BA Ops
insert into admin_role_permissions (admin_role_id, permission) values
	(2, 'AmendAdministrator_Creator'),
	(2, 'AmendAdministrator_View'),
	(2, 'ClientGroups_CreateAmend'),
	(2, 'RequestProcessing_AuditEdit'),
	(2, 'RequestProcessing_AuditView'),
	(2, 'RequestProcessing_ReferredEdit'),
	(2, 'RequestProcessing_ReferredView'),
	(2, 'RequestProcessing_StandardEdit'),
	(2, 'RequestProcessing_StandardView')
go

-- BA Ops Approvers
insert into admin_role_permissions (admin_role_id, permission) values
	(3, 'AmendAdministrator_Approver'),
	(3, 'AmendAdministrator_View'),
	(3, 'ClientGroups_Approve')
go

-- BA Direct
insert into admin_role_permissions (admin_role_id, permission) values
	(4, 'AmendAdministrator_Creator'),
	(4, 'AmendAdministrator_View'),
	(4, 'ClientGroups_CreateAmend'),
	(4, 'RequestProcessing_AuditEdit'),
	(4, 'RequestProcessing_AuditView'),
	(4, 'RequestProcessing_ReferredEdit'),
	(4, 'RequestProcessing_ReferredView'),
	(4, 'RequestProcessing_StandardEdit'),
	(4, 'RequestProcessing_StandardView')
go

-- BA Direct Approvers
insert into admin_role_permissions (admin_role_id, permission) values
	(5, 'AmendAdministrator_Approver'),
	(5, 'AmendAdministrator_View'),
	(5, 'ClientGroups_Approve')
go

-- BA Global Resources
insert into admin_role_permissions (admin_role_id, permission) values
	(6, 'RequestProcessing_AuditView'),
	(6, 'RequestProcessing_ReferredView'),
	(6, 'RequestProcessing_StandardEdit'),
	(6, 'RequestProcessing_StandardView')
go

-- BA Global Resources Auditors
insert into admin_role_permissions (admin_role_id, permission) values
	(7, 'RequestProcessing_AuditEdit'),
	(7, 'RequestProcessing_AuditView'),
	(7, 'RequestProcessing_ReferredView'),
	(7, 'RequestProcessing_StandardView')
go

-- BA System Admin
insert into admin_role_permissions (admin_role_id, permission) values
	(8, 'AmendAdministrator_Creator'),
	(8, 'AmendAdministrator_View')
go

-- BA Systems Admin Approvers
insert into admin_role_permissions (admin_role_id, permission) values
	(9, 'AmendAdministrator_Approver'),
	(9, 'AmendAdministrator_View')
go

-- BA Sales & Account Management
insert into admin_role_permissions (admin_role_id, permission) values
	(10, 'AmendAdministrator_Creator'),
	(10, 'AmendAdministrator_View'),
	(10, 'ClientGroups_CreateAmend'),
	(10, 'RequestProcessing_AuditView'),
	(10, 'RequestProcessing_ReferredView'),
	(10, 'RequestProcessing_StandardView')
go

-- BA Sales & Account Management Approvers
insert into admin_role_permissions (admin_role_id, permission) values
	(11, 'AmendAdministrator_Approver'),
	(11, 'AmendAdministrator_View'),
	(11, 'ClientGroups_Approve'),
	(11, 'RequestProcessing_AuditView'),
	(11, 'RequestProcessing_ReferredView'),
	(11, 'RequestProcessing_StandardView')
go