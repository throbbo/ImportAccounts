create table new_account_invitations (
	new_account_invitation_id int not null identity primary key,
	billing_account_id int not null references accounts(account_id),
	date_created datetime not null,
	date_expires datetime not null,	
	invitation_token uniqueidentifier not null,
	first_name nvarchar(255) not null,
	last_name nvarchar(255) not null,
	email nvarchar(255) not null,
	completed_card_application_id int null references card_applications(card_application_id),
	account_request_id int not null references account_requests(account_request_id)
)

create unique index IX_new_account_invitations_invitation_token on new_account_invitations(invitation_token)