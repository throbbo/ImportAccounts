if exists(select 1 from sysobjects where name  = 'spend_by_day')
	drop table spend_by_day
go

CREATE TABLE spend_by_day
(
     spend_by_day_id int identity(1,1) not null,
	 client_id int NOT NULL FOREIGN KEY REFERENCES clients(client_id),
	 day_start_date datetime not null, 
     transaction_count int not null,
     spend_total decimal(18,4) NOT NULL,
	 week_no int NOT NULL,
	 month_no int NOT NULL,
	 day_no int not null,
	 week_start_date datetime not null, 
	 month_start_date datetime not null, 
     CONSTRAINT pk_spend_by_day PRIMARY KEY (spend_by_day_id)
)
go


if exists(select 1 from sysobjects where name  = 'refresh_spend_by_day_sp')
	drop procedure refresh_spend_by_day_sp
go
create procedure refresh_spend_by_day_sp (@daysback int = 3650) as
begin
	truncate table spend_by_day;

	SET DATEFIRST 1;

	declare @startofcurrentmonth datetime, @startofcurrentweek datetime
	declare @currentDate datetime = getdate()

	select @startofcurrentmonth = DATEADD(month, DATEDIFF(month, 0, @currentDate), 0),
		@startofcurrentweek = cast(cast(DATEADD(dd, -(DATEPART(dw, @currentDate)-1), getutcdate()) as date) as datetime)

	insert into spend_by_day (
		client_id,
		day_start_date,
		transaction_count,
		spend_total,
		month_no,
		week_no,
		day_no,
		week_start_date,
		month_start_date
	)
	SELECT	a.client_id, 
			t.transaction_date day_start_date
			,count(1) transaction_count
			,sum(t.amount) spend_amount
			,datediff(month, t.transaction_date, @startofcurrentmonth) month_no
			,datediff(wk, DATEADD(dd, -(DATEPART(dw, t.transaction_date)-1), t.transaction_date), @startofcurrentweek) week_no
			,datediff(day, t.transaction_date, getdate()) day_no
			,DATEADD(dd, -(DATEPART(dw, t.transaction_date)-1), t.transaction_date) week_start_date 
			,DATEADD(month, DATEDIFF(month, 0, t.transaction_date), 0) month_start_date 
	FROM
			accounts a
			inner join billing_periods on a.client_id = billing_periods.client_id
			inner join transactions t on t.account_id = a.account_id              
			inner join transaction_types tt on t.transaction_type_id = tt.transaction_type_id
			inner join transaction_type_categories ttc on tt.transaction_type_category_id = ttc.transaction_type_category_id
	where t.transaction_date IS NULL OR (t.billing_period_id = billing_periods.billing_period_id and ttc.name != 'Payments')
	and datediff(day, t.transaction_date, getutcdate()) <= @daysback
	group by a.client_id, t.transaction_date 


	-- Select all clients for all days that DONT have a CLient/Day record
	-- insert into there with 0 sum, 0 count and week_no etc updates
	
	;WITH 
		daynumbers as (
			SELECT TOP (@daysback) day_no = CONVERT(INT, ROW_NUMBER() OVER (ORDER BY s1.[object_id]))
			FROM sys.all_objects AS s1 
			CROSS JOIN sys.all_objects AS s2),
		dayslist as (
			select 0 day_no, cast(@currentDate as date) day_start_date
			union
			select day_no, cast(DATEADD(day, -day_no, @currentDate) as date) day_start_date
			from daynumbers),
		clients_all_days as (
			select c.client_id, d.day_start_date, d.day_no 
			from clients c
				cross join dayslist d)

	insert into spend_by_day (client_id,
		day_start_date,
		transaction_count,
		spend_total,
		month_no,
		week_no,
		day_no,
		week_start_date,
		month_start_date ) 
	select cad.client_id
		,cad.day_start_date
		,0 transaction_count
		,0 spend_total
		,datediff(month, cad.day_start_date, @startofcurrentmonth) month_no
		,datediff(wk, DATEADD(dd, -(DATEPART(dw, cad.day_start_date)-1), cad.day_start_date), @startofcurrentweek) week_no
		,datediff(day, cad.day_start_date, getdate()) day_no
		,DATEADD(dd, -(DATEPART(dw, cad.day_start_date)-1), cad.day_start_date) week_start_date 
		,DATEADD(month, DATEDIFF(month, 0, cad.day_start_date), 0) month_start_date 
	from clients_all_days cad
	where not exists(select 1 from spend_by_day sbd where sbd.client_id = cad.client_id and sbd.day_no = cad.day_no)

end
go
