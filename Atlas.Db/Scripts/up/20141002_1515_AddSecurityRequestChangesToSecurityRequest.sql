alter table security_requests add changes nvarchar(max) null
go

update security_requests set changes =''

alter table security_requests alter column changes nvarchar(max) not null


