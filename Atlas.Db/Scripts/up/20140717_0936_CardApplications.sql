create table genders
(
	gender nvarchar(100) not null primary key
)

insert into genders(gender) values ('Male')
insert into genders(gender) values ('Female')

create table application_priorites
(
	value int not null primary key,
	name varchar(50)
)

insert into application_priorites(value, name) values (1, 'High')
insert into application_priorites(value, name) values (2, 'Medium')
insert into application_priorites(value, name) values (3, 'Low')

create table card_applications
(
    card_application_id int identity primary key,
	account_request_id int not null references account_requests(account_request_id),
	encrypted_billing_account_pan varchar(max) not null,
    date_aggregated datetime null,
	date_ready_for_aggregation datetime null,
    date_created datetime not null,
	
	application_priority int not null references application_priorites(value),

    title nvarchar(255) not null,
    first_name nvarchar(255) not null,
    last_name nvarchar(255) not null,

    date_of_birth date not null,
    gender nvarchar(100) not null references genders(gender),
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