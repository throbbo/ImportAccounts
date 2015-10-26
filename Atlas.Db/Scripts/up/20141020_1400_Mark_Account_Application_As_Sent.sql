create procedure mark_account_application_as_sent
	@account_application_id int,
	@date_sent datetime
as
begin
	set nocount on;

	update account_requests
	set account_request_status = 'PendingUpdate'
	where account_request_id in (select account_request_id from card_applications where card_application_id = @account_application_id)
end