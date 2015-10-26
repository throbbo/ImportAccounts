create table localizations (
	localization_id int identity not null primary key,
	culture nvarchar(10) not null,
	name nvarchar(100) not null,
	text nvarchar(max)
);

create unique index localization_uidx on localizations(culture, name)
;