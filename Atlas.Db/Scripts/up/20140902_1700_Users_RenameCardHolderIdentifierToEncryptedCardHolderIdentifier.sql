alter table users add encrypted_card_holder_identifier nvarchar(1000) null;
go
update users set encrypted_card_holder_identifier = card_holder_identifier;
update users set encrypted_card_holder_identifier = '' where encrypted_card_holder_identifier is null;
alter table users alter column encrypted_card_holder_identifier nvarchar(1000) not null;
drop index IX_users_client_id_card_holder_identifier on users;
go
alter table [users] drop column card_holder_identifier;
create index IX_users_client_id_encrypted_card_holder_identifier on users(client_id ASC, encrypted_card_holder_identifier ASC);