if exists (select 1 from sys.objects where object_id = OBJECT_ID('UserClientsSecurity') and type = 'tr')
    drop trigger UserClientsSecurity
go

CREATE TRIGGER UserClientsSecurity ON dbo.user_clients
AFTER INSERT, UPDATE
AS     
    IF EXISTS ( 
        select 1 from inserted i
            inner join users u on u.user_id = i.user_id
            inner join clients cu on cu.client_id = u.primary_client_id
            inner join clients ci on ci.client_id = i.client_id
        where u.system_role = 4
        and not (
            cu.client_id = ci.client_id
            or (cu.client_id != ci.client_id and coalesce(ci.client_group_id, 0) in (select coalesce(client_group_id, -1) from clients where client_id = cu.client_id))
        )
    )
    BEGIN
        rollback
        RAISERROR ('Security Issue', 16, 1);
    END
go
