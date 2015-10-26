create table user_widgets(
	user_widget_id int identity primary key not null, 
	user_id int not null FOREIGN KEY REFERENCES users(user_id),
	name nvarchar(100) not null,
	widget_id nvarchar(100) not null,
	settings nvarchar(max) not null
);


create table user_widget_orders(
	user_id int not null foreign key references users(user_id),
	role int not null,
	widget_order nvarchar(max) not null,
	primary key(user_id, role)
)