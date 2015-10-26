if exists(select 1 from sysobjects where name = 'ordered_billing_periods_view')
	drop view ordered_billing_periods_view
go
CREATE VIEW ordered_billing_periods_view
as
	WITH bp_start_from AS (
		   SELECT
				  client_id, MAX(start_date) [start_date]
		   FROM
				  billing_periods
		   GROUP BY
				  client_id
	)

	SELECT billing_periods.*, ROW_NUMBER()
		over (
			PARTITION BY billing_periods.client_id
			order by end_date desc
		)-1  AS RowNo 
		FROM billing_periods
		   JOIN bp_start_from on bp_start_from.client_id = billing_periods.client_id
		   WHERE billing_periods.start_date <= bp_start_from.start_date
go

if exists(select 1 from sysobjects where name = 'spend_by_period_view')
	drop view spend_by_period_view
go
create view spend_by_period_view as 
	select
       s.*, bp.rowno, bp.start_date, bp.end_date
	from
       spend_by_period s 
              join ordered_billing_periods_view bp on bp.billing_period_id = s.billing_period_id 
go
