alter table admin_role_permissions nocheck constraint fk__admin_role_permissions__permission
alter table user_permissions nocheck constraint all

update permissions set permission = 'MessageCenter_CreateAmend' where permission = 'MessageCenter_Create'
update user_permissions set permission = 'MessageCenter_CreateAmend' where permission = 'MessageCenter_Create'
update admin_role_permissions set permission = 'MessageCenter_CreateAmend' where permission = 'MessageCenter_Create'

alter table admin_role_permissions check constraint fk__admin_role_permissions__permission
alter table user_permissions check constraint all