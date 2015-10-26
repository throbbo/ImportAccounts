alter table import_files add card_scheme_id int null;
go
update import_files set card_scheme_id = (select top 1 ccs.card_scheme_id from client_card_schemes ccs inner join clients c on ccs.client_id = c.client_id where c.company_identification = import_files.company_identification);
alter table import_files alter column card_scheme_id int not null;
alter table import_files add constraint FK_import_files_card_schemes foreign key (card_scheme_id) references card_schemes(card_scheme_id);