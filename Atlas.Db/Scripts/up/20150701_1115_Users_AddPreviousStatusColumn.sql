alter table users add previous_status int null;
go

update users set previous_status = 0 where previous_status is null;