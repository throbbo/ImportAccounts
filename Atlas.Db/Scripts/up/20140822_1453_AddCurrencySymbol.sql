alter table currencies add currency_symbol nvarchar(4) not null default '????'
go

update currencies set currency_symbol=N'$' where currency_iso_code='AUD'
update currencies set currency_symbol=N'¥' where currency_iso_code='CNY'	
update currencies set currency_symbol=N'$' where currency_iso_code='USD'	
update currencies set currency_symbol=N'£' where currency_iso_code='GBP'	
update currencies set currency_symbol=N'$' where currency_iso_code='NZD'	
update currencies set currency_symbol=N'¥' where currency_iso_code='JPY'	
update currencies set currency_symbol=N'€' where currency_iso_code='EUR'	
update currencies set currency_symbol=N'Rp' where currency_iso_code='IDR'	
update currencies set currency_symbol=N'﷼' where currency_iso_code='IRR'		
go
