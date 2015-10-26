alter table card_schemes add card_feed_type nvarchar(50) null
go
update card_schemes set card_feed_type = ''
alter table card_schemes alter column card_feed_type nvarchar(50) not null