create table merchants (
	merchant_id int identity primary key,
	name nvarchar(255) not null,
	card_scheme_id int not null,
    merchant_category_code int not null,
    iso_country_code nvarchar(255),
	city nvarchar(255),
	post_code nvarchar(25),
	vat_number nvarchar(50),
	create_date datetimeoffset default SYSDATETIMEOFFSET(),
	CONSTRAINT merchant_merchant_category_fkey FOREIGN KEY (card_scheme_id,merchant_category_code) REFERENCES merchant_categories(card_scheme_id,merchant_category_code)
)