create table account_holders
(
	account_holder_id int identity not null primary key,
	client_id int NOT NULL,
	first_name nvarchar(50) NULL,
	last_name nvarchar(50) NULL,
	email nvarchar(255) NULL,
	mobile nvarchar(30) NULL,
	home_phone nvarchar(50) NOT NULL,
	work_phone nvarchar(50) NOT NULL,
	date_of_birth date NULL,
	employee_id nvarchar(255) NULL,
	other_id nvarchar(50) NOT NULL,
	middle_name nvarchar(50) NOT NULL,
	additional_data nvarchar(max) NOT NULL,
	encrypted_card_holder_identifier nvarchar(1000) NOT NULL,
	reference varchar(90) NOT NULL,
	address_line_1 nvarchar(255) NOT NULL,
	address_line_2 nvarchar(255) NOT NULL,
	address_line_3 nvarchar(255) NOT NULL,
	city nvarchar(255) NOT NULL,
	[state] nvarchar(255) NOT NULL,
	postal_code nvarchar(15) NOT NULL,
	country_iso_number int NULL,

	account_id int not null,

	CONSTRAINT fk__account_holders__client_id FOREIGN KEY (client_id) REFERENCES clients(client_id)
)

alter table accounts add account_holder_id int null

go

--migrate data accross to account holders
insert into account_holders
(
	client_id, account_id,
	first_name, last_name, email, mobile, home_phone, work_phone, date_of_birth, employee_id, other_id, middle_name, additional_data, encrypted_card_holder_identifier, reference,
	address_line_1, address_line_2, address_line_3, city, [state], postal_code, country_iso_number
)
select
	a.client_id, a.account_id,
	u.first_name, u.last_name, u.email, u.mobile, u.home_phone, u.work_phone, u.date_of_birth, u.employee_id, u.other_id, u.middle_name, u.additional_data, u.encrypted_card_holder_identifier, u.reference,
	a.address_line_1, a.address_line_2, a.address_line_3, a.city, a.[state], a.postal_code, a.country_iso_number
from accounts a
	left join users u on a.user_id = u.user_id

update a
	set account_holder_id = ah.account_holder_id
from accounts a
inner join account_holders ah on a.account_id = ah.account_id
go


--enforce foreign keys
alter table accounts add constraint fk__accounts__account_holder_id FOREIGN KEY (account_holder_id) REFERENCES account_holders(account_holder_id)
--remove temporary columns
alter table account_holders drop column account_id

go



--remove obsolete columns from account
alter table accounts drop column
	address_line_1,
	address_line_2,
	address_line_3,
	city,
	[state],
	postal_code,
	country_iso_number

--remove obsolete columns from user
if exists (select name from sys.indexes where name = N'IX_users_client_id_encrypted_card_holder_identifier')
begin
	drop index IX_users_client_id_encrypted_card_holder_identifier on users;
end

if exists (select name from sys.indexes where name = N'ix_users_reference')
begin
	drop index ix_users_reference on users;
end

alter table users drop column
	date_of_birth,
	middle_name,
	additional_data,
	encrypted_card_holder_identifier,
	reference