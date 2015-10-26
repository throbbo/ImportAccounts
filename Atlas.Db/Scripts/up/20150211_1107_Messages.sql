alter table messages 
  add user_id int null,
  date_sent datetime null
go
update messages set user_id = (select top 1 user_id from users where email = 'admin@admin.com')
alter table messages alter column user_id int not null
alter table messages add constraint fk_messages_user_id foreign key (user_id) references users(user_id)