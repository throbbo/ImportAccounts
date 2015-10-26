alter table accounts add [address_line_1] nvarchar(255) null
alter table accounts add [address_line_2] nvarchar(255) null
alter table accounts add [address_line_3] nvarchar(255) null
alter table accounts add [city] nvarchar(255) null
alter table accounts add [state] nvarchar(255) null
alter table accounts add [postal_code] nvarchar(15) null
alter table accounts add [country_iso_number] int null

go

update accounts 
set
	address_line_1 = u.address_line_1,
	address_line_2 = u.address_line_2,
	address_line_3 = u.address_line_3,
	city = u.city,
	[state] = u.[state],
	postal_code = u.postal_code,
	country_iso_number = u.country_iso_number
from accounts
inner join users u on accounts.user_id = u.user_id

go

alter table accounts alter column [address_line_1] nvarchar(255) not null
alter table accounts alter column [address_line_2] nvarchar(255) not null
alter table accounts alter column [address_line_3] nvarchar(255) not null
alter table accounts alter column [city] nvarchar(255) not null
alter table accounts alter column [state] nvarchar(255) not null
alter table accounts alter column [postal_code] nvarchar(15) not null