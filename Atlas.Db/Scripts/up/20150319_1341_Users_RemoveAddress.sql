declare @dropConstraint varchar(1000)

BEGIN TRY
	select @dropConstraint = (SELECT distinct 'ALTER TABLE ' + t.name + ' DROP CONSTRAINT ' + d.name + '; ' AS [text()]
		from sys.tables t
			join sys.default_constraints d on d.parent_object_id = t.object_id
			join sys.columns c on c.object_id = t.object_id and c.column_id = d.parent_column_id
		where t.name = 'USERS' and c.name in ('address_line_1', 'address_line_2', 'address_line_3', 'city', 'state', 'postal_code')
		For XML PATH (''))
		
	exec (@dropConstraint)
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
	select @dropConstraint = (SELECT distinct 'ALTER TABLE ' + TABLE_NAME + ' DROP CONSTRAINT ' + CONSTRAINT_NAME
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE CONSTRAINT_NAME like 'FK__users__country_%'
		AND table_name = 'users')
		
	exec (@dropConstraint)
END TRY
BEGIN CATCH
END CATCH

alter table users drop column [address_line_1]
alter table users drop column [address_line_2]
alter table users drop column [address_line_3]
alter table users drop column [city]
alter table users drop column [state]
alter table users drop column [postal_code]
alter table users drop column [country_iso_number]