alter table users add home_phone nvarchar(50) not null default ''
alter table users add work_phone nvarchar(50) not null default ''
alter table users add address_line_1 nvarchar(255) not null default ''
alter table users add address_line_2 nvarchar(255) not null default ''
alter table users add address_line_3 nvarchar(255) not null default ''
alter table users add city nvarchar(255) not null default ''
alter table users add [state] nvarchar(255) not null default ''
alter table users add postal_code nvarchar(15) not null default ''
alter table users add country_iso_number int null references countries(country_iso_number)
alter table users add date_of_birth date null