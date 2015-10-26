alter table merchants add card_acceptor_id nvarchar(26) null
go
update merchants set card_acceptor_id = ''
alter table merchants alter column card_acceptor_id nvarchar(26) not null