alter table currencies add decimal_places int null
GO

update currencies set decimal_places=0 where currency_iso_code in('BIF','BYR','CLP','CVE','DJF','GNF','ISK','JPY','KMF','KRW','PYG','RWF','UGX','UYI','VND','VUV','XAF','XOF','XPF');
update currencies set decimal_places=2 where currency_iso_code in('AED','AFN','ALL','AMD','ANG','AOA','ARS','AUD','AWG','AZM','AZN','BAM','BBD','BDT','BGN','BMD','BND','BOB','BOV','BRL','BSD','BTN','BWP','BZD','CAD','CDF','CHE','CHF','CHW','CNY','COP','CRC','CSD','CUC','CUP','CVE','CYP','CZK','DKK','DOP','DZD','EEK','EGP','ERN','ETB','EUR','FJD','FKP','GBP','GEL','GHC','GHS','GIP','GMD','GTQ','GYD','HKD','HNL','HRK','HTG','HUF','IDR','ILS','INR','IRR','JMD','KES','KGS','KHR','KPW','KYD','KZT','LAK','LBP','LKR','LRD','LSL','LTL','LVL','MAD','MDL','MGA','MKD','MMK','MNT','MOP','MRO','MTL','MUR','MVR','MWK','MXN','MXV','MYR','MZM','MZN','NAD','NGN','NIO','NOK','NPR','NZD','PAB','PEN','PGK','PHP','PKR','PLN','QAR','RON','RSD','RUB','SAR','SBD','SCR','SDD','SDG','SEK','SGD','SHP','SIT','SKK','SLL','SOS','SRD','SSP','STD','SVC','SYP','SZL','THB','TJS','TMM','TMT','TOP','TRY','TTD','TWD','TZS','UAH','UGX','USD','USN','USS','UYU','UZS','VEB','VEF','VND','WST','XCD','YER','ZAR','ZMK','ZMW','ZWD','ZWL');
update currencies set decimal_places=3 where currency_iso_code in('BHD','IQD','JOD','KWD','LYD','OMR','TND');
update currencies set decimal_places=4 where currency_iso_code in('CLF');
update currencies set decimal_places=5 where currency_iso_code in('XDR');

-- Unspecified, default to 2
update currencies set decimal_places=2 where currency_iso_code in('XBA','XBB','XBC','XBD','XAU','XAG','XPT','XTS','XPD','XUA','COU','XSU','XXX');

alter table currencies alter column decimal_places int not null