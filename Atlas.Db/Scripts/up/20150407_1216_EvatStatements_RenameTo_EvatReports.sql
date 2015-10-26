EXEC sp_rename 'evat_statements', 'evat_reports'
GO

EXEC sp_rename 'evat_reports.evat_statement_id', 'evat_report_id', 'COLUMN'
GO