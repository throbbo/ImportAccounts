alter table accounts Add
	card_scheme_id int not null FOREIGN KEY REFERENCES card_schemes(card_scheme_id)
	
ALTER TABLE client_card_schemes ADD CONSTRAINT FK_client_card_schemes_clients FOREIGN KEY (client_id) REFERENCES clients(client_id)
ALTER TABLE client_card_schemes ADD CONSTRAINT FK_client_card_schemes_card_schemes FOREIGN KEY (card_scheme_id) REFERENCES card_schemes(card_scheme_id)