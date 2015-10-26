create table permissions (
	permission nvarchar(255) not null primary key
)

insert into permissions(permission) values ('OnlineCardApplication_Creator')
insert into permissions(permission) values ('OnlineCardApplication_Approver')

create table user_permissions (	
	user_id int not null references users(user_id),
	permission nvarchar(255) not null references permissions(permission),
	constraint PK_user_permissions primary key (user_id, permission)
)

