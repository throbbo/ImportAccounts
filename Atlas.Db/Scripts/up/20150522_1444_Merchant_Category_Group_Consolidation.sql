
-- DROP constraints

ALTER TABLE [dbo].[merchant_categories] 
	DROP CONSTRAINT [merchant_categories_merchant_category_groups_fkey]
GO

ALTER TABLE [dbo].[merchant_category_group_blocking_codes] 
	DROP CONSTRAINT [merchant_category_group_blocking_codes_pkey]
GO

ALTER TABLE [dbo].[merchant_category_group_blocking_codes] 
	DROP CONSTRAINT [merchant_category_group_blocking_codes_merchant_category_group_fkey]
GO

ALTER TABLE [dbo].[merchant_category_groups] DROP CONSTRAINT [merchant_category_groups_pkey]
GO

DECLARE @constraint_name VARCHAR(500)

SET @constraint_name = (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'merchant_category_groups')

EXEC ('ALTER TABLE merchant_category_groups DROP CONSTRAINT ' + @constraint_name)
GO

-- DELETE redundant data

DELETE FROM [dbo].[merchant_category_groups] WHERE card_scheme_id <> 1
GO

-- DROP redundant card_scheme_id column

ALTER TABLE [dbo].[merchant_category_groups] 
	DROP COLUMN card_scheme_id
GO

ALTER TABLE [dbo].[merchant_category_group_blocking_codes] 
	DROP COLUMN [card_scheme_id]
GO

-- ADD necessary contraints back

ALTER TABLE [dbo].[merchant_category_groups] 
	ADD CONSTRAINT [merchant_category_groups_pkey] PRIMARY KEY ([merchant_category_group_code])
GO

ALTER TABLE [dbo].[merchant_category_group_blocking_codes]
	ADD CONSTRAINT [merchant_category_group_blocking_codes_pkey]
	PRIMARY KEY ([account_id] ASC, [merchant_category_group_code] ASC)
GO

ALTER TABLE [dbo].[merchant_category_group_blocking_codes]  
	WITH CHECK 
	ADD CONSTRAINT [merchant_category_group_blocking_codes_merchant_category_group_fkey] 
	FOREIGN KEY([merchant_category_group_code])
	REFERENCES [dbo].[merchant_category_groups]([merchant_category_group_code])
GO

ALTER TABLE [dbo].[merchant_category_group_blocking_codes] 
	CHECK CONSTRAINT [merchant_category_group_blocking_codes_merchant_category_group_fkey]
GO
