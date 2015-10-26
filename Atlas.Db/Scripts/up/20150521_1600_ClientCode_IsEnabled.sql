alter table client_codes add is_enabled bit null
GO
update client_codes set is_enabled = 1
alter table client_codes alter column is_enabled bit not null