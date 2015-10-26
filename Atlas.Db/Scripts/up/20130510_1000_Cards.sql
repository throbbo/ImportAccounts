create table accounts (
	account_id int identity not null primary key,
	client_id int not null FOREIGN KEY REFERENCES clients(client_id),
	billing_account_id int null FOREIGN KEY REFERENCES accounts(account_id),
	is_billing_account bit default(0),
	masked_card_number varchar(24),
	expiry_date date,
	account_status varchar(20),
	account_status_reason varchar(50),
	last_name nvarchar(255),
	first_name nvarchar(255),
	email nvarchar(255),
	atm_limit decimal(16,4),
	credit_limit decimal(16,4),
	cycle_spending_limit decimal(16,4),
	transaction_spending_limit decimal(16,4),
	transaction_daily_limit int,
	transaction_cycle_limit int,
	extra_data nvarchar(max),
	billing_name nvarchar(255),
	date_opened date,
	date_closed date null,
	cycle_limit decimal(16,4),
	emboss_line_1 nvarchar(50),
	emboss_line_2 nvarchar(50),
	cost_center nvarchar(50),
	centrally_billed bit,
	account_status_date date null,
	delinquency_days int null
);

create table user_clients (
	user_id int FOREIGN KEY REFERENCES users(user_id),
	client_id int FOREIGN KEY REFERENCES clients(client_id),
	primary key (user_id, client_id)
);

