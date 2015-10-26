IF NOT EXISTS(SELECT * FROM sys.columns WHERE [name] = N'translation_key' AND [object_id] = OBJECT_ID(N'merchant_category_groups'))
BEGIN
    alter table merchant_category_groups
		add translation_key nvarchar(100) null;
END
GO

update merchant_category_groups set translation_key = 'BUILDING_SERVICES' where merchant_category_group_code = 1;
update merchant_category_groups set translation_key = 'BUILDING_MATERIALS' where merchant_category_group_code = 2;
update merchant_category_groups set translation_key = 'ESTATE_AND_GARDEN_SERVICES' where merchant_category_group_code = 3;
update merchant_category_groups set translation_key = 'UTILITIES_AND_NON_AUTOMOTIVE_FUEL' where merchant_category_group_code = 4;
update merchant_category_groups set translation_key = 'TELECOMMUNICATION_SERVICES' where merchant_category_group_code = 5;
update merchant_category_groups set translation_key = 'CATERING_AND_CATERING_SUPPLIES' where merchant_category_group_code = 6;
update merchant_category_groups set translation_key = 'CLEANING_SERVICES_AND_SUPPLIES' where merchant_category_group_code = 7;
update merchant_category_groups set translation_key = 'TRAINING_AND_EDUCATIONAL' where merchant_category_group_code = 8;
update merchant_category_groups set translation_key = 'MEDICAL_SUPPLIES_AND_SERVICES' where merchant_category_group_code = 9;
update merchant_category_groups set translation_key = 'STAFF_TEMPORARY_RECRUITMENT' where merchant_category_group_code = 10;
update merchant_category_groups set translation_key = 'BUSINESS_CLOTHING_AND_FOOTWEAR' where merchant_category_group_code = 11;
update merchant_category_groups set translation_key = 'MAIL_ORDER_DIRECT_SELLING' where merchant_category_group_code = 12;
update merchant_category_groups set translation_key = 'PERSONAL_SERVICES' where merchant_category_group_code = 13;
update merchant_category_groups set translation_key = 'FREIGHT_AND_STORAGE' where merchant_category_group_code = 14;
update merchant_category_groups set translation_key = 'PROFESSIONAL_SERVICES' where merchant_category_group_code = 15;
update merchant_category_groups set translation_key = 'FINANCIAL_SERVICES' where merchant_category_group_code = 16;
update merchant_category_groups set translation_key = 'CLUBS_ASSOCIATIONS_ORGANISATIONS' where merchant_category_group_code = 17;
update merchant_category_groups set translation_key = 'STATUTORY_BODIES' where merchant_category_group_code = 18;
update merchant_category_groups set translation_key = 'OFFICE_STATIONERY_EQUIPMENT_AND_SUPPLIES' where merchant_category_group_code = 19;
update merchant_category_groups set translation_key = 'COMPUTER_EQUIPMENT_SERVICES' where merchant_category_group_code = 20;
update merchant_category_groups set translation_key = 'PRINT_AND_ADVERTISING' where merchant_category_group_code = 21;
update merchant_category_groups set translation_key = 'BOOKS_AND_PERIODICALS' where merchant_category_group_code = 22;
update merchant_category_groups set translation_key = 'MAIL_AND_COURIER_SERVICES' where merchant_category_group_code = 23;
update merchant_category_groups set translation_key = 'MISCELLANEOUS_INDUSTRIAL_COMMERCIAL_SUPPLIES' where merchant_category_group_code = 24;
update merchant_category_groups set translation_key = 'VEHICLES_SERVICING_AND_REPAIRS' where merchant_category_group_code = 25;
update merchant_category_groups set translation_key = 'AUTOMOTIVE_FUEL' where merchant_category_group_code = 26;
update merchant_category_groups set translation_key = 'TRAVEL_AIR_RAIL_ROAD' where merchant_category_group_code = 27;
update merchant_category_groups set translation_key = 'AUTO_RENTAL' where merchant_category_group_code = 28;
update merchant_category_groups set translation_key = 'HOTELS_AND_ACCOMMODATION' where merchant_category_group_code = 29;
update merchant_category_groups set translation_key = 'RESTAURANTS_AND_BARS' where merchant_category_group_code = 30;
update merchant_category_groups set translation_key = 'GENERAL_RETAIL_AND_WHOLESALE' where merchant_category_group_code = 31;
update merchant_category_groups set translation_key = 'LEISURE_ACTIVITIES' where merchant_category_group_code = 32;
update merchant_category_groups set translation_key = 'MISCELLANEOUS' where merchant_category_group_code = 33;
update merchant_category_groups set translation_key = 'CASH' where merchant_category_group_code = 34;

IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = N'ix__merchant_category_groups__name' AND [object_id] = OBJECT_ID(N'merchant_category_groups'))
BEGIN
	drop index ix__merchant_category_groups__name on merchant_category_groups;
END
GO

IF EXISTS(SELECT * FROM sys.columns WHERE [name] = N'translation_key' AND [object_id] = OBJECT_ID(N'merchant_category_groups') AND is_nullable = 1)
BEGIN
	alter table merchant_category_groups
		alter column translation_key nvarchar(100) not null;
END
go

IF EXISTS(SELECT * FROM sys.columns WHERE [name] = N'name' AND [object_id] = OBJECT_ID(N'merchant_category_groups'))
BEGIN
	alter table merchant_category_groups drop column name;
END
go
	

	