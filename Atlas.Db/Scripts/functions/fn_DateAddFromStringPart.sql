IF OBJECT_ID('dbo.fn_DateAddFromStringPart', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_DateAddFromStringPart
GO

-- From http://stackoverflow.com/questions/834971/sql-dynamic-datepart-when-using-datediff
CREATE FUNCTION fn_DateAddFromStringPart
(
    @Interval VARCHAR(11),
    @Increment INT,
    @Date SMALLDATETIME
)
RETURNS DATETIME
AS
BEGIN
    -- Declare the return variable here
    DECLARE @NewDate DATETIME

    -- Add the T-SQL statements to compute the return value here
    SELECT @NewDate = CASE
        WHEN @Interval IN ('year', 'yy', 'yyyy') THEN DATEADD(YEAR, @Increment, @Date)
        WHEN @Interval IN ('quarter', 'qq', 'q') THEN DATEADD(QUARTER, @Increment, @Date)
        WHEN @Interval IN ('month', 'mm', 'm') THEN DATEADD(MONTH, @Increment, @Date)
        WHEN @Interval IN ('dayofyear', 'dy', '') THEN DATEADD(DAYOFYEAR, @Increment, @Date)
        WHEN @Interval IN ('day', 'dd', 'd') THEN DATEADD(DAY, @Increment, @Date)
        WHEN @Interval IN ('week', 'wk', 'ww') THEN DATEADD(WEEK, @Increment, @Date)
        WHEN @Interval IN ('weekday', 'dw', 'w') THEN DATEADD(WEEKDAY, @Increment, @Date)
        WHEN @Interval IN ('hour', 'hh') THEN DATEADD(HOUR, @Increment, @Date)
        WHEN @Interval IN ('minute', 'mi', 'n') THEN DATEADD(MINUTE, @Increment, @Date)
        WHEN @Interval IN ('second', 'ss', 's') THEN DATEADD(SECOND, @Increment, @Date)
        WHEN @Interval IN ('millisecond', 'ms') THEN DATEADD(MILLISECOND, @Increment, @Date)
        WHEN @Interval IN ('microsecond', 'mcs') THEN DATEADD(MICROSECOND, @Increment, @Date)
        WHEN @Interval IN ('nanosecond', 'ns') THEN DATEADD(NANOSECOND, @Increment, @Date)
    END

    -- Return the result of the function
    RETURN @NewDate

END
GO