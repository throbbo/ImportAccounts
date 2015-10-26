exec sp_rename 'users.client_id', 'primary_client_id', 'COLUMN';
go

alter table users alter column primary_client_id int null;
go

alter table users add constraint fk__users__client_id foreign key (primary_client_id) references clients(client_id);
go