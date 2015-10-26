create table proxy_invites
(
	proxy_invite_id int not null identity primary key,
	invite_code nvarchar(20) not null,
	date_expires date not null,
	registered_proxy_user_id int null,
	user_id int not null,
	email nvarchar(50) not null,
	CONSTRAINT ux_proxy_invites__proxy_invite_id unique (proxy_invite_id), 
	CONSTRAINT fk__proxy_invites__user_id__users FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk__proxy_invites__registered_proxy_user_user_id__users FOREIGN KEY (registered_proxy_user_id) REFERENCES users(user_id)
)