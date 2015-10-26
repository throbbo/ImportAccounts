alter table user_files add date_created datetime null
go

update user_files set date_created = '1900-01-01' where date_created is null

alter table user_files alter column date_created datetime not null
go

create table euro_dd_files (
    euro_dd_file_id int not null identity primary key,
    user_id int not null constraint fk__euro_dd_files__user_id references users(user_id),
    user_file_id int not null constraint fk__euro_dd_files__user_file_id references user_files(user_file_id),
    email_id int not null constraint fk__euro_dd_files__email_id references emails(email_id)
)