create table card_schemes (
	card_scheme_id int identity not null primary key,
	bank_name nvarchar(255),
	scheme_name nvarchar(255)
)

create table client_card_schemes (
	card_scheme_id int not null,
	client_id int not null,
	CONSTRAINT client_card_schemes_pkey PRIMARY KEY (client_id, card_scheme_id)
)

create table merchant_category_groups (
	merchant_category_group_code int not null, 
	card_scheme_id int not null FOREIGN KEY REFERENCES card_schemes(card_scheme_id),
	name nvarchar(255),
	CONSTRAINT merchant_category_groups_pkey PRIMARY KEY (card_scheme_id, merchant_category_group_code)
)

create table merchant_categories (
	merchant_category_code int not null,
	card_scheme_id int not null FOREIGN KEY REFERENCES card_schemes(card_scheme_id),
	merchant_category_group_code int null,
	name nvarchar(255),
	CONSTRAINT merchant_categories_pkey PRIMARY KEY (card_scheme_id, merchant_category_code),
	CONSTRAINT merchant_categories_merchant_category_groups_fkey FOREIGN KEY (card_scheme_id,merchant_category_group_code) REFERENCES merchant_category_groups(card_scheme_id,merchant_category_group_code) 
)

