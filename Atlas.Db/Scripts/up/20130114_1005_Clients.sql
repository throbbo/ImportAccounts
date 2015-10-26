create table client_groups (
	client_group_id int identity not null primary key,
	group_name nvarchar(100)
);

create table clients (
	client_id int identity not null primary key,
	client_group_id int null FOREIGN KEY REFERENCES client_groups(client_group_id),
	name nvarchar(100),
	starting_date date,
	spending_limit numeric(16,4),
	company_identification nvarchar(20)
);
