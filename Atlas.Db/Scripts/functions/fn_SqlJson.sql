CREATE ASSEMBLY [SqlJson]
WITH PERMISSION_SET = UNSAFE
GO

CREATE FUNCTION [dbo].QueryJsonAsString(@Input nvarchar(max), @Path nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.QueryJsonAsString
GO

CREATE FUNCTION [dbo].QueryJsonAsBool(@Input nvarchar(max), @Path nvarchar(max)) RETURNS bit
EXTERNAL NAME  SqlJson.JsonFunctions.QueryJsonAsBool
GO

CREATE FUNCTION [dbo].QueryJsonAsDouble(@Input nvarchar(max), @Path nvarchar(max)) RETURNS float
EXTERNAL NAME  SqlJson.JsonFunctions.QueryJsonAsDouble
GO

CREATE FUNCTION [dbo].QueryJsonAsDateTime(@Input nvarchar(max), @Path nvarchar(max)) RETURNS datetime
EXTERNAL NAME  SqlJson.JsonFunctions.QueryJsonAsDateTime
GO

CREATE FUNCTION [dbo].InsertJsonStringValue(@Input nvarchar(max), @Path nvarchar(max), @Key nvarchar(max), @Value nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.InsertJsonStringValue
GO

CREATE FUNCTION [dbo].InsertJsonBoolValue(@Input nvarchar(max), @Path nvarchar(max), @Key nvarchar(max), @Value bit) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.InsertJsonBoolValue
GO

CREATE FUNCTION [dbo].InsertJsonDoubleValue(@Input nvarchar(max), @Path nvarchar(max), @Key nvarchar(max), @Value float) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.InsertJsonDoubleValue
GO

CREATE FUNCTION [dbo].InsertJsonDateTimeValue(@Input nvarchar(max), @Path nvarchar(max), @Key nvarchar(max), @Value datetime) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.InsertJsonDateTimeValue
GO

CREATE FUNCTION [dbo].InsertJsonJsonValue(@Input nvarchar(max), @Path nvarchar(max), @Key nvarchar(max), @Value nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.InsertJsonJsonValue
GO

CREATE FUNCTION [dbo].UpdateJsonStringValue(@Input nvarchar(max), @Path nvarchar(max), @Value nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.UpdateJsonStringValue
GO

CREATE FUNCTION [dbo].UpdateJsonBoolValue(@Input nvarchar(max), @Path nvarchar(max), @Value bit) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.UpdateJsonBoolValue
GO

CREATE FUNCTION [dbo].UpdateJsonDoubleValue(@Input nvarchar(max), @Path nvarchar(max), @Value float) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.UpdateJsonDoubleValue
GO

CREATE FUNCTION [dbo].UpdateJsonDateTimeValue(@Input nvarchar(max), @Path nvarchar(max), @Value datetime) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.UpdateJsonDateTimeValue
GO

CREATE FUNCTION [dbo].UpdateJsonJsonValue(@Input nvarchar(max), @Path nvarchar(max), @Value nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.UpdateJsonJsonValue
GO

CREATE FUNCTION [dbo].DeleteJsonValue(@Input nvarchar(max), @Path nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  SqlJson.JsonFunctions.DeleteJsonValue
GO
