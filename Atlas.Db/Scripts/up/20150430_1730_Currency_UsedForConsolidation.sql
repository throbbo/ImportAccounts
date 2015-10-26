alter table clients drop column consolidation_currency_iso_number;
GO

alter table users add consolidation_currency_iso_number int null 
	constraint fk_users_consolidation_currency_iso_number__currency foreign key references currencies (currency_iso_number);
GO

update users 
	set consolidation_currency_iso_number = p.default_currency_iso_number
from users u 
	left join clients c on u.client_id = c.client_id
	left join client_card_schemes ccs on c.client_id = ccs.client_id
	left join card_schemes cs on ccs.card_scheme_id = cs.card_scheme_id
	left join products p on p.product_id = coalesce(cs.product_id, 1)

alter table users alter column consolidation_currency_iso_number int not null;

alter table currencies add used_for_consolidation bit not null default 0

alter table clients add currency_iso_number int null 
	constraint fk_clients_currency_iso_number__currency foreign key references currencies (currency_iso_number);
GO

update clients
	set currency_iso_number = a.currency_iso_number
from clients c
	join accounts a on a.client_id = c.client_id;
