create table user_devices (
    user_device_id int identity not null constraint pk_user_devices__user_device_id primary key,
    user_id int not null constraint fk_user_devices_user_id_users_user_id REFERENCES users(user_id),
    device_id uniqueidentifier not null,
    pin nvarchar(max) not null,
    deactivated bit not null,
    date_created datetime not null,
    date_deactivated datetime null
);
