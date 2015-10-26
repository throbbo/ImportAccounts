alter table transaction_codings 
add approved_by_user_id int null 
	constraint fk__transaction_codings__approved_by_user_id 
	foreign key references users(user_id);
go

update transaction_codings 
set approved_by_user_id = (select min(user_id) from users) 
where approved_by_user_id is null
	and status = 'Approved';
go
