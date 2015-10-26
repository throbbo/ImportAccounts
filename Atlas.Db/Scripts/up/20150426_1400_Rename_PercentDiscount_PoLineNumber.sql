alter table transaction_line_items drop column optional_field_2;
alter table transaction_line_items add percent_discount numeric(16,4) not null default 0;

EXEC sp_rename 'transaction_line_items.optional_field_1', 'po_line_number', 'COLUMN'