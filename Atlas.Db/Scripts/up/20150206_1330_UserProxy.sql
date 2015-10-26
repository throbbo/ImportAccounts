create table user_proxies
(
	user_id int not null,
	proxy_user_id int not null,
	constraint PK_user_proxies primary key (user_id, proxy_user_id),
	CONSTRAINT fk__user_proxies__user_id__users FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk__user_proxies__proxy_user_id__users FOREIGN KEY (proxy_user_id) REFERENCES users(user_id)
)