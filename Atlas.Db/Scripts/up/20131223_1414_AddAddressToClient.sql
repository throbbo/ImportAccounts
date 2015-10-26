ALTER TABLE clients	ADD
	address_line_1 nvarchar(50) NOT NULL,
	address_line_2 nvarchar(50) NOT NULL,
	address_line_3 nvarchar(50) NOT NULL,
	city nvarchar(50) NOT NULL,
	state nvarchar(50) NOT NULL,
	country nvarchar(50) NOT NULL,
	postal_code nvarchar(20) NOT NULL