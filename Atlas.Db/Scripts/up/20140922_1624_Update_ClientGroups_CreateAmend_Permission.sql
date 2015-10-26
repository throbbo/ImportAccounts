alter table user_permissions nocheck constraint all
update permissions set permission = 'ClientGroups_CreateAmend' where permission = 'ClientGroups_Create_Amend'
update user_permissions set permission = 'ClientGroups_CreateAmend' where permission = 'ClientGroups_Create_Amend'
alter table user_permissions check constraint all