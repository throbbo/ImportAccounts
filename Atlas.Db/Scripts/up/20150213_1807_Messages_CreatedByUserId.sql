alter table messages add created_by_user_id int null
go
update messages set created_by_user_id = user_id
alter table messages alter column created_by_user_id int not null
alter table messages add constraint fk_messages_created_by_user_id foreign key (created_by_user_id) references users(user_id)
alter table messages drop constraint fk_messages_user_id 
alter table messages drop column user_id
