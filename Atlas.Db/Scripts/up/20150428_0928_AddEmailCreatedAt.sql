alter table emails 
    add created_at datetime null;
go

update emails set created_at = getutcdate()-1 where created_at is null;

alter table emails
    alter column created_at datetime not null;
