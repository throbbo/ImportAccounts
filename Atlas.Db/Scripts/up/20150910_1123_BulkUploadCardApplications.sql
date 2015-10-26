create table bulk_upload_card_applications
(
	bulk_upload_card_application_id int identity not null constraint pk__bulk_upload_card_applications primary key,
	bulk_upload_file_id int not null constraint fk__bulk_upload_card_applications__bulk_upload_file_id foreign key references bulk_upload_files(bulk_upload_file_id),

	parent_account_id int not null,
	title nvarchar(255) null,
	first_name nvarchar(255) not null,
	last_name nvarchar(255) not null,
	date_of_birth date null,
	gender nvarchar(100) null,
	employee_id nvarchar(255) null,
	email_address nvarchar(255) not null,
	memorable_word nvarchar(255) not null,
	address_line_1 nvarchar(255) not null,
	address_line_2 nvarchar(255) not null,
	address_line_3 nvarchar(255) not null,
	city nvarchar(255) not null,
	state_province nvarchar(255) not null,
	country nvarchar(255) not null,
	postal_code nvarchar(255) not null,
	home_phone_number nvarchar(255) not null,
	work_phone_number nvarchar(255) not null,
	mobile_phone_number nvarchar(255) not null,
	embossed_company_name nvarchar(255) not null,
	embossed_title nvarchar(255) not null,
	embossed_first_name nvarchar(255) not null,
	embossed_last_name nvarchar(255) not null,
	direct_debit_required bit not null,
	repayment_bank_account_code varchar(255) not null,
	repayment_bank_account_number varchar(255) not null,
	credit_limit money null,
	atm_limit money null,
	transaction_limit money null,
	can_use_pin bit null,
	mcg_blocking_codes nvarchar(max) null,
)