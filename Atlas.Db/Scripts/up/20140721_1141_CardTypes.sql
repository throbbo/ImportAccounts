create table card_types (
	card_type_id int not null,
	card_scheme_id int not null,
	name nvarchar(255) not null
)
go
alter table card_types ADD CONSTRAINT PK_card_types PRIMARY KEY (card_type_id, card_scheme_id)

insert into card_types(card_scheme_id, card_type_id, name) values (1, 1, 'Corporate')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 2, 'Purchasing')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 3, 'Business Credit')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 4, 'Commercial')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 5, 'Fleet')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 6, 'Distribution')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 7, 'Business Debit')
insert into card_types(card_scheme_id, card_type_id, name) values (1, 9, 'Multiple Card Types')

alter table accounts add card_type_id int null
go

update accounts set card_type_id = 2 where card_scheme_id = 1
alter table accounts alter column card_type_id int not null
go

alter table accounts ADD CONSTRAINT FK_accounts_card_types FOREIGN KEY (card_type_id, card_scheme_id) REFERENCES card_types(card_type_id, card_scheme_id)