ALTER TABLE terms_and_conditions_versions DROP COLUMN [terms_and_conditions_version_key];
ALTER TABLE [terms_and_conditions_versions] ADD [terms_and_conditions_version_key] DATETIME NULL;
GO
Update terms_and_conditions_versions SET [terms_and_conditions_version_key] = (dateadd("DAY",[terms_and_conditions_version_id],GETUTCDATE()) - 1000 + [terms_and_conditions_version_id]);
ALTER TABLE [terms_and_conditions_versions] ALTER COLUMN [terms_and_conditions_version_key] DATETIME NOT NULL;