CREATE TABLE geopoints
(
    country_iso_number int NOT NULL PRIMARY KEY, 
    latitude float NOT NULL, 
    longitude float NOT NULL, 
    geography_point AS (geography::STGeomFromText(((('POINT('+CONVERT(varchar(20),longitude))+' ')+CONVERT(varchar(20),latitude))+')',(4326))) 
)

insert into countries (country_iso_number, country_name, country_iso_alpha_2, country_iso_alpha_3, currency_iso_number)
values (530, 'Netherlands Antilles', 'AN', 'ANT', 532)

insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AD'), 42.5,1.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AE'), 24,54
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AF'), 33,65
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AG'), 17.05,-61.8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AI'), 18.25,-63.1667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AL'), 41,20
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AM'), 40,45
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AN'), 12.25,-68.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AO'), -12.5,18.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AQ'), -90,0
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AR'), -34,-64
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AS'), -14.3333,-170
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AT'), 47.3333,13.3333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AU'), -27,133
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AW'), 12.5,-69.9667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'AZ'), 40.5,47.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BA'), 44,18
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BB'), 13.1667,-59.5333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BD'), 24,90
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BE'), 50.8333,4
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BF'), 13,-2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BG'), 43,25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BH'), 26,50.55
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BI'), -3.5,30
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BJ'), 9.5,2.25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BM'), 32.3333,-64.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BN'), 4.5,114.6667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BO'), -17,-65
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BR'), -10,-55
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BS'), 24.25,-76
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BT'), 27.5,90.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BV'), -54.4333,3.4
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BW'), -22,24
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BY'), 53,28
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'BZ'), 17.25,-88.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CA'), 60,-95
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CC'), -12.5,96.8333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CD'), 0,25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CF'), 7,21
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CG'), -1,15
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CH'), 47,8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CI'), 8,-5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CK'), -21.2333,-159.7667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CL'), -30,-71
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CM'), 6,12
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CN'), 35,105
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CO'), 4,-72
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CR'), 10,-84
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CU'), 21.5,-80
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CV'), 16,-24
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CX'), -10.5,105.6667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CY'), 35,33
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'CZ'), 49.75,15.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'DE'), 51,9
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'DJ'), 11.5,43
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'DK'), 56,10
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'DM'), 15.4167,-61.3333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'DO'), 19,-70.6667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'DZ'), 28,3
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'EC'), -2,-77.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'EE'), 59,26
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'EG'), 27,30
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'EH'), 24.5,-13
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ER'), 15,39
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ES'), 40,-4
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ET'), 8,38
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'FI'), 64,26
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'FJ'), -18,175
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'FK'), -51.75,-59
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'FM'), 6.9167,158.25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'FO'), 62,-7
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'FR'), 46,2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GA'), -1,11.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GB'), 54,-2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GD'), 12.1167,-61.6667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GE'), 42,43.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GF'), 4,-53
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GH'), 8,-2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GI'), 36.1833,-5.3667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GL'), 72,-40
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GM'), 13.4667,-16.5667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GN'), 11,-10
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GP'), 16.25,-61.5833
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GQ'), 2,10
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GR'), 39,22
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GS'), -54.5,-37
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GT'), 15.5,-90.25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GU'), 13.4667,144.7833
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GW'), 12,-15
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'GY'), 5,-59
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'HK'), 22.25,114.1667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'HM'), -53.1,72.5167
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'HN'), 15,-86.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'HR'), 45.1667,15.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'HT'), 19,-72.4167
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'HU'), 47,20
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ID'), -5,120
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IE'), 53,-8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IL'), 31.5,34.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IN'), 20,77
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IO'), -6,71.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IQ'), 33,44
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IR'), 32,53
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IS'), 65,-18
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'IT'), 42.8333,12.8333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'JM'), 18.25,-77.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'JO'), 31,36
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'JP'), 36,138
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KE'), 1,38
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KG'), 41,75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KH'), 13,105
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KI'), 1.4167,173
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KM'), -12.1667,44.25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KN'), 17.3333,-62.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KP'), 40,127
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KR'), 37,127.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KW'), 29.3375,47.6581
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KY'), 19.5,-80.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'KZ'), 48,68
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LA'), 18,105
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LB'), 33.8333,35.8333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LC'), 13.8833,-61.1333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LI'), 47.1667,9.5333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LK'), 7,81
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LR'), 6.5,-9.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LS'), -29.5,28.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LT'), 56,24
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LU'), 49.75,6.1667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LV'), 57,25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'LY'), 25,17
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MA'), 32,-5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MC'), 43.7333,7.4
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MD'), 47,29
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ME'), 42,19
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MG'), -20,47
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MH'), 9,168
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MK'), 41.8333,22
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ML'), 17,-4
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MM'), 22,98
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MN'), 46,105
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MO'), 22.1667,113.55
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MP'), 15.2,145.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MQ'), 14.6667,-61
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MR'), 20,-12
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MS'), 16.75,-62.2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MT'), 35.8333,14.5833
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MU'), -20.2833,57.55
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MV'), 3.25,73
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MW'), -13.5,34
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MX'), 23,-102
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MY'), 2.5,112.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'MZ'), -18.25,35
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NA'), -22,17
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NC'), -21.5,165.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NE'), 16,8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NF'), -29.0333,167.95
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NG'), 10,8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NI'), 13,-85
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NL'), 52.5,5.75
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NO'), 62,10
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NP'), 28,84
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NR'), -0.5333,166.9167
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NU'), -19.0333,-169.8667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'NZ'), -41,174
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'OM'), 21,57
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PA'), 9,-80
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PE'), -10,-76
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PF'), -15,-140
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PG'), -6,147
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PH'), 13,122
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PK'), 30,70
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PL'), 52,20
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PM'), 46.8333,-56.3333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PR'), 18.25,-66.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PS'), 32,35.25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PT'), 39.5,-8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PW'), 7.5,134.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'PY'), -23,-58
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'QA'), 25.5,51.25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'RE'), -21.1,55.6
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'RO'), 46,25
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'RS'), 44,21
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'RU'), 60,100
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'RW'), -2,30
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SA'), 25,45
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SB'), -8,159
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SC'), -4.5833,55.6667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SD'), 15,30
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SE'), 62,15
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SG'), 1.3667,103.8
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SH'), -15.9333,-5.7
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SI'), 46,15
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SJ'), 78,20
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SK'), 48.6667,19.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SL'), 8.5,-11.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SM'), 43.7667,12.4167
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SN'), 14,-14
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SO'), 10,49
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SR'), 4,-56
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ST'), 1,7
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SV'), 13.8333,-88.9167
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SY'), 35,38
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'SZ'), -26.5,31.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TC'), 21.75,-71.5833
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TD'), 15,19
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TF'), -43,67
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TG'), 8,1.1667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TH'), 15,100
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TJ'), 39,71
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TK'), -9,-172
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TM'), 40,60
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TN'), 34,9
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TO'), -20,-175
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TR'), 39,35
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TT'), 11,-61
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TV'), -8,178
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TW'), 23.5,121
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'TZ'), -6,35
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'UA'), 49,32
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'UG'), 1,32
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'UM'), 19.2833,166.6
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'US'), 38,-97
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'UY'), -33,-56
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'UZ'), 41,64
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VA'), 41.9,12.45
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VC'), 13.25,-61.2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VE'), 8,-66
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VG'), 18.5,-64.5
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VI'), 18.3333,-64.8333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VN'), 16,106
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'VU'), -16,167
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'WF'), -13.3,-176.2
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'WS'), -13.5833,-172.3333
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'YE'), 15,48
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'YT'), -12.8333,45.1667
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ZA'), -29,24
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ZM'), -15,30
insert into geopoints (country_iso_number, latitude, longitude) select (select country_iso_number from countries where country_iso_alpha_2 = 'ZW'), -20,30

alter table countries 
add continent nvarchar(2) null
go

update countries set continent = 'AS' where country_iso_alpha_2 = 'AF'
update countries set continent = 'EU' where country_iso_alpha_2 = 'AL'
update countries set continent = 'AN' where country_iso_alpha_2 = 'AQ'
update countries set continent = 'AF' where country_iso_alpha_2 = 'DZ'
update countries set continent = 'OC' where country_iso_alpha_2 = 'AS'
update countries set continent = 'EU' where country_iso_alpha_2 = 'AD'
update countries set continent = 'AF' where country_iso_alpha_2 = 'AO'
update countries set continent = 'NA' where country_iso_alpha_2 = 'AG'
update countries set continent = 'EU' where country_iso_alpha_2 = 'AZ'
update countries set continent = 'AS' where country_iso_alpha_2 = 'AZ'
update countries set continent = 'SA' where country_iso_alpha_2 = 'AR'
update countries set continent = 'OC' where country_iso_alpha_2 = 'AU'
update countries set continent = 'EU' where country_iso_alpha_2 = 'AT'
update countries set continent = 'NA' where country_iso_alpha_2 = 'BS'
update countries set continent = 'AS' where country_iso_alpha_2 = 'BH'
update countries set continent = 'AS' where country_iso_alpha_2 = 'BD'
update countries set continent = 'EU' where country_iso_alpha_2 = 'AM'
update countries set continent = 'AS' where country_iso_alpha_2 = 'AM'
update countries set continent = 'NA' where country_iso_alpha_2 = 'BB'
update countries set continent = 'EU' where country_iso_alpha_2 = 'BE'
update countries set continent = 'NA' where country_iso_alpha_2 = 'BM'
update countries set continent = 'AS' where country_iso_alpha_2 = 'BT'
update countries set continent = 'SA' where country_iso_alpha_2 = 'BO'
update countries set continent = 'EU' where country_iso_alpha_2 = 'BA'
update countries set continent = 'AF' where country_iso_alpha_2 = 'BW'
update countries set continent = 'AN' where country_iso_alpha_2 = 'BV'
update countries set continent = 'SA' where country_iso_alpha_2 = 'BR'
update countries set continent = 'NA' where country_iso_alpha_2 = 'BZ'
update countries set continent = 'AS' where country_iso_alpha_2 = 'IO'
update countries set continent = 'OC' where country_iso_alpha_2 = 'SB'
update countries set continent = 'NA' where country_iso_alpha_2 = 'VG'
update countries set continent = 'AS' where country_iso_alpha_2 = 'BN'
update countries set continent = 'EU' where country_iso_alpha_2 = 'BG'
update countries set continent = 'AS' where country_iso_alpha_2 = 'MM'
update countries set continent = 'AF' where country_iso_alpha_2 = 'BI'
update countries set continent = 'EU' where country_iso_alpha_2 = 'BY'
update countries set continent = 'AS' where country_iso_alpha_2 = 'KH'
update countries set continent = 'AF' where country_iso_alpha_2 = 'CM'
update countries set continent = 'NA' where country_iso_alpha_2 = 'CA'
update countries set continent = 'AF' where country_iso_alpha_2 = 'CV'
update countries set continent = 'NA' where country_iso_alpha_2 = 'KY'
update countries set continent = 'AF' where country_iso_alpha_2 = 'CF'
update countries set continent = 'AS' where country_iso_alpha_2 = 'LK'
update countries set continent = 'AF' where country_iso_alpha_2 = 'TD'
update countries set continent = 'SA' where country_iso_alpha_2 = 'CL'
update countries set continent = 'AS' where country_iso_alpha_2 = 'CN'
update countries set continent = 'AS' where country_iso_alpha_2 = 'TW'
update countries set continent = 'AS' where country_iso_alpha_2 = 'CX'
update countries set continent = 'AS' where country_iso_alpha_2 = 'CC'
update countries set continent = 'SA' where country_iso_alpha_2 = 'CO'
update countries set continent = 'AF' where country_iso_alpha_2 = 'KM'
update countries set continent = 'AF' where country_iso_alpha_2 = 'YT'
update countries set continent = 'AF' where country_iso_alpha_2 = 'CG'
update countries set continent = 'AF' where country_iso_alpha_2 = 'CD'
update countries set continent = 'OC' where country_iso_alpha_2 = 'CK'
update countries set continent = 'NA' where country_iso_alpha_2 = 'CR'
update countries set continent = 'EU' where country_iso_alpha_2 = 'HR'
update countries set continent = 'NA' where country_iso_alpha_2 = 'CU'
update countries set continent = 'EU' where country_iso_alpha_2 = 'CY'
update countries set continent = 'AS' where country_iso_alpha_2 = 'CY'
update countries set continent = 'EU' where country_iso_alpha_2 = 'CZ'
update countries set continent = 'AF' where country_iso_alpha_2 = 'BJ'
update countries set continent = 'EU' where country_iso_alpha_2 = 'DK'
update countries set continent = 'NA' where country_iso_alpha_2 = 'DM'
update countries set continent = 'NA' where country_iso_alpha_2 = 'DO'
update countries set continent = 'SA' where country_iso_alpha_2 = 'EC'
update countries set continent = 'NA' where country_iso_alpha_2 = 'SV'
update countries set continent = 'AF' where country_iso_alpha_2 = 'GQ'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ET'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ER'
update countries set continent = 'EU' where country_iso_alpha_2 = 'EE'
update countries set continent = 'EU' where country_iso_alpha_2 = 'FO'
update countries set continent = 'SA' where country_iso_alpha_2 = 'FK'
update countries set continent = 'AN' where country_iso_alpha_2 = 'GS'
update countries set continent = 'OC' where country_iso_alpha_2 = 'FJ'
update countries set continent = 'EU' where country_iso_alpha_2 = 'FI'
update countries set continent = 'EU' where country_iso_alpha_2 = 'AX'
update countries set continent = 'EU' where country_iso_alpha_2 = 'FR'
update countries set continent = 'SA' where country_iso_alpha_2 = 'GF'
update countries set continent = 'OC' where country_iso_alpha_2 = 'PF'
update countries set continent = 'AN' where country_iso_alpha_2 = 'TF'
update countries set continent = 'AF' where country_iso_alpha_2 = 'DJ'
update countries set continent = 'AF' where country_iso_alpha_2 = 'GA'
update countries set continent = 'EU' where country_iso_alpha_2 = 'GE'
update countries set continent = 'AS' where country_iso_alpha_2 = 'GE'
update countries set continent = 'AF' where country_iso_alpha_2 = 'GM'
update countries set continent = 'AS' where country_iso_alpha_2 = 'PS'
update countries set continent = 'EU' where country_iso_alpha_2 = 'DE'
update countries set continent = 'AF' where country_iso_alpha_2 = 'GH'
update countries set continent = 'EU' where country_iso_alpha_2 = 'GI'
update countries set continent = 'OC' where country_iso_alpha_2 = 'KI'
update countries set continent = 'EU' where country_iso_alpha_2 = 'GR'
update countries set continent = 'NA' where country_iso_alpha_2 = 'GL'
update countries set continent = 'NA' where country_iso_alpha_2 = 'GD'
update countries set continent = 'NA' where country_iso_alpha_2 = 'GP'
update countries set continent = 'OC' where country_iso_alpha_2 = 'GU'
update countries set continent = 'NA' where country_iso_alpha_2 = 'GT'
update countries set continent = 'AF' where country_iso_alpha_2 = 'GN'
update countries set continent = 'SA' where country_iso_alpha_2 = 'GY'
update countries set continent = 'NA' where country_iso_alpha_2 = 'HT'
update countries set continent = 'AN' where country_iso_alpha_2 = 'HM'
update countries set continent = 'EU' where country_iso_alpha_2 = 'VA'
update countries set continent = 'NA' where country_iso_alpha_2 = 'HN'
update countries set continent = 'AS' where country_iso_alpha_2 = 'HK'
update countries set continent = 'EU' where country_iso_alpha_2 = 'HU'
update countries set continent = 'EU' where country_iso_alpha_2 = 'IS'
update countries set continent = 'AS' where country_iso_alpha_2 = 'IN'
update countries set continent = 'AS' where country_iso_alpha_2 = 'ID'
update countries set continent = 'AS' where country_iso_alpha_2 = 'IR'
update countries set continent = 'AS' where country_iso_alpha_2 = 'IQ'
update countries set continent = 'EU' where country_iso_alpha_2 = 'IE'
update countries set continent = 'AS' where country_iso_alpha_2 = 'IL'
update countries set continent = 'EU' where country_iso_alpha_2 = 'IT'
update countries set continent = 'AF' where country_iso_alpha_2 = 'CI'
update countries set continent = 'NA' where country_iso_alpha_2 = 'JM'
update countries set continent = 'AS' where country_iso_alpha_2 = 'JP'
update countries set continent = 'EU' where country_iso_alpha_2 = 'KZ'
update countries set continent = 'AS' where country_iso_alpha_2 = 'KZ'
update countries set continent = 'AS' where country_iso_alpha_2 = 'JO'
update countries set continent = 'AF' where country_iso_alpha_2 = 'KE'
update countries set continent = 'AS' where country_iso_alpha_2 = 'KP'
update countries set continent = 'AS' where country_iso_alpha_2 = 'KR'
update countries set continent = 'AS' where country_iso_alpha_2 = 'KW'
update countries set continent = 'AS' where country_iso_alpha_2 = 'KG'
update countries set continent = 'AS' where country_iso_alpha_2 = 'LA'
update countries set continent = 'AS' where country_iso_alpha_2 = 'LB'
update countries set continent = 'AF' where country_iso_alpha_2 = 'LS'
update countries set continent = 'EU' where country_iso_alpha_2 = 'LV'
update countries set continent = 'AF' where country_iso_alpha_2 = 'LR'
update countries set continent = 'AF' where country_iso_alpha_2 = 'LY'
update countries set continent = 'EU' where country_iso_alpha_2 = 'LI'
update countries set continent = 'EU' where country_iso_alpha_2 = 'LT'
update countries set continent = 'EU' where country_iso_alpha_2 = 'LU'
update countries set continent = 'AS' where country_iso_alpha_2 = 'MO'
update countries set continent = 'AF' where country_iso_alpha_2 = 'MG'
update countries set continent = 'AF' where country_iso_alpha_2 = 'MW'
update countries set continent = 'AS' where country_iso_alpha_2 = 'MY'
update countries set continent = 'AS' where country_iso_alpha_2 = 'MV'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ML'
update countries set continent = 'EU' where country_iso_alpha_2 = 'MT'
update countries set continent = 'NA' where country_iso_alpha_2 = 'MQ'
update countries set continent = 'AF' where country_iso_alpha_2 = 'MR'
update countries set continent = 'AF' where country_iso_alpha_2 = 'MU'
update countries set continent = 'NA' where country_iso_alpha_2 = 'MX'
update countries set continent = 'EU' where country_iso_alpha_2 = 'MC'
update countries set continent = 'AS' where country_iso_alpha_2 = 'MN'
update countries set continent = 'EU' where country_iso_alpha_2 = 'MD'
update countries set continent = 'EU' where country_iso_alpha_2 = 'ME'
update countries set continent = 'NA' where country_iso_alpha_2 = 'MS'
update countries set continent = 'AF' where country_iso_alpha_2 = 'MA'
update countries set continent = 'AF' where country_iso_alpha_2 = 'MZ'
update countries set continent = 'AS' where country_iso_alpha_2 = 'OM'
update countries set continent = 'AF' where country_iso_alpha_2 = 'NA'
update countries set continent = 'OC' where country_iso_alpha_2 = 'NR'
update countries set continent = 'AS' where country_iso_alpha_2 = 'NP'
update countries set continent = 'EU' where country_iso_alpha_2 = 'NL'
update countries set continent = 'NA' where country_iso_alpha_2 = 'AN'
update countries set continent = 'NA' where country_iso_alpha_2 = 'CW'
update countries set continent = 'NA' where country_iso_alpha_2 = 'AW'
update countries set continent = 'NA' where country_iso_alpha_2 = 'SX'
update countries set continent = 'NA' where country_iso_alpha_2 = 'BQ'
update countries set continent = 'OC' where country_iso_alpha_2 = 'NC'
update countries set continent = 'OC' where country_iso_alpha_2 = 'VU'
update countries set continent = 'OC' where country_iso_alpha_2 = 'NZ'
update countries set continent = 'NA' where country_iso_alpha_2 = 'NI'
update countries set continent = 'AF' where country_iso_alpha_2 = 'NE'
update countries set continent = 'AF' where country_iso_alpha_2 = 'NG'
update countries set continent = 'OC' where country_iso_alpha_2 = 'NU'
update countries set continent = 'OC' where country_iso_alpha_2 = 'NF'
update countries set continent = 'EU' where country_iso_alpha_2 = 'NO'
update countries set continent = 'OC' where country_iso_alpha_2 = 'MP'
update countries set continent = 'OC' where country_iso_alpha_2 = 'UM'
update countries set continent = 'NA' where country_iso_alpha_2 = 'UM'
update countries set continent = 'OC' where country_iso_alpha_2 = 'FM'
update countries set continent = 'OC' where country_iso_alpha_2 = 'MH'
update countries set continent = 'OC' where country_iso_alpha_2 = 'PW'
update countries set continent = 'AS' where country_iso_alpha_2 = 'PK'
update countries set continent = 'NA' where country_iso_alpha_2 = 'PA'
update countries set continent = 'OC' where country_iso_alpha_2 = 'PG'
update countries set continent = 'SA' where country_iso_alpha_2 = 'PY'
update countries set continent = 'SA' where country_iso_alpha_2 = 'PE'
update countries set continent = 'AS' where country_iso_alpha_2 = 'PH'
update countries set continent = 'OC' where country_iso_alpha_2 = 'PN'
update countries set continent = 'EU' where country_iso_alpha_2 = 'PL'
update countries set continent = 'EU' where country_iso_alpha_2 = 'PT'
update countries set continent = 'AF' where country_iso_alpha_2 = 'GW'
update countries set continent = 'AS' where country_iso_alpha_2 = 'TL'
update countries set continent = 'NA' where country_iso_alpha_2 = 'PR'
update countries set continent = 'AS' where country_iso_alpha_2 = 'QA'
update countries set continent = 'AF' where country_iso_alpha_2 = 'RE'
update countries set continent = 'EU' where country_iso_alpha_2 = 'RO'
update countries set continent = 'EU' where country_iso_alpha_2 = 'RU'
update countries set continent = 'AS' where country_iso_alpha_2 = 'RU'
update countries set continent = 'AF' where country_iso_alpha_2 = 'RW'
update countries set continent = 'NA' where country_iso_alpha_2 = 'BL'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SH'
update countries set continent = 'NA' where country_iso_alpha_2 = 'KN'
update countries set continent = 'NA' where country_iso_alpha_2 = 'AI'
update countries set continent = 'NA' where country_iso_alpha_2 = 'LC'
update countries set continent = 'NA' where country_iso_alpha_2 = 'MF'
update countries set continent = 'NA' where country_iso_alpha_2 = 'PM'
update countries set continent = 'NA' where country_iso_alpha_2 = 'VC'
update countries set continent = 'EU' where country_iso_alpha_2 = 'SM'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ST'
update countries set continent = 'AS' where country_iso_alpha_2 = 'SA'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SN'
update countries set continent = 'EU' where country_iso_alpha_2 = 'RS'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SC'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SL'
update countries set continent = 'AS' where country_iso_alpha_2 = 'SG'
update countries set continent = 'EU' where country_iso_alpha_2 = 'SK'
update countries set continent = 'AS' where country_iso_alpha_2 = 'VN'
update countries set continent = 'EU' where country_iso_alpha_2 = 'SI'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SO'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ZA'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ZW'
update countries set continent = 'EU' where country_iso_alpha_2 = 'ES'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SS'
update countries set continent = 'AF' where country_iso_alpha_2 = 'EH'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SD'
update countries set continent = 'SA' where country_iso_alpha_2 = 'SR'
update countries set continent = 'EU' where country_iso_alpha_2 = 'SJ'
update countries set continent = 'AF' where country_iso_alpha_2 = 'SZ'
update countries set continent = 'EU' where country_iso_alpha_2 = 'SE'
update countries set continent = 'EU' where country_iso_alpha_2 = 'CH'
update countries set continent = 'AS' where country_iso_alpha_2 = 'SY'
update countries set continent = 'AS' where country_iso_alpha_2 = 'TJ'
update countries set continent = 'AS' where country_iso_alpha_2 = 'TH'
update countries set continent = 'AF' where country_iso_alpha_2 = 'TG'
update countries set continent = 'OC' where country_iso_alpha_2 = 'TK'
update countries set continent = 'OC' where country_iso_alpha_2 = 'TO'
update countries set continent = 'NA' where country_iso_alpha_2 = 'TT'
update countries set continent = 'AS' where country_iso_alpha_2 = 'AE'
update countries set continent = 'AF' where country_iso_alpha_2 = 'TN'
update countries set continent = 'EU' where country_iso_alpha_2 = 'TR'
update countries set continent = 'AS' where country_iso_alpha_2 = 'TR'
update countries set continent = 'AS' where country_iso_alpha_2 = 'TM'
update countries set continent = 'NA' where country_iso_alpha_2 = 'TC'
update countries set continent = 'OC' where country_iso_alpha_2 = 'TV'
update countries set continent = 'AF' where country_iso_alpha_2 = 'UG'
update countries set continent = 'EU' where country_iso_alpha_2 = 'UA'
update countries set continent = 'EU' where country_iso_alpha_2 = 'MK'
update countries set continent = 'AF' where country_iso_alpha_2 = 'EG'
update countries set continent = 'EU' where country_iso_alpha_2 = 'GB'
update countries set continent = 'EU' where country_iso_alpha_2 = 'GG'
update countries set continent = 'EU' where country_iso_alpha_2 = 'JE'
update countries set continent = 'EU' where country_iso_alpha_2 = 'IM'
update countries set continent = 'AF' where country_iso_alpha_2 = 'TZ'
update countries set continent = 'NA' where country_iso_alpha_2 = 'US'
update countries set continent = 'NA' where country_iso_alpha_2 = 'VI'
update countries set continent = 'AF' where country_iso_alpha_2 = 'BF'
update countries set continent = 'SA' where country_iso_alpha_2 = 'UY'
update countries set continent = 'AS' where country_iso_alpha_2 = 'UZ'
update countries set continent = 'SA' where country_iso_alpha_2 = 'VE'
update countries set continent = 'OC' where country_iso_alpha_2 = 'WF'
update countries set continent = 'OC' where country_iso_alpha_2 = 'WS'
update countries set continent = 'AS' where country_iso_alpha_2 = 'YE'
update countries set continent = 'AF' where country_iso_alpha_2 = 'ZM'
update countries set continent = 'OC' where country_iso_alpha_2 = 'XX'
update countries set continent = 'AS' where country_iso_alpha_2 = 'XE'
update countries set continent = 'AS' where country_iso_alpha_2 = 'XD'
update countries set continent = 'AS' where country_iso_alpha_2 = 'XS'

