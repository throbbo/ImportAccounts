create table user_device_logins (
    user_device_login_id int identity not null constraint pk_user_device_logins__user_device_login_id primary key,
    user_device_id int null constraint fk_user_device_logins_device_id_user_devices_device_id REFERENCES user_devices(user_device_id),
    user_id int not null constraint fk_user_devices_logins_user_id_users_user_id REFERENCES users(user_id),
    device_id uniqueidentifier not null,
    date datetime not null,
    success bit not null,
    ip_address nvarchar(max) not null,
    app_version nvarchar(max) not null,
    message nvarchar(max) not null
);
