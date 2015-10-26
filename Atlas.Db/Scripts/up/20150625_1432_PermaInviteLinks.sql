create table card_application_perma_links
  (
    card_application_perma_link_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    parent_account_id int FOREIGN KEY REFERENCES accounts(account_id) NOT NULL,
    date_created datetime NOT NULL,
    date_disabled datetime NULL,
    perma_token uniqueidentifier NOT NULL,
    disabled bit NOT NULL,
    custom_message nvarchar(400) NULL
  )

  create table card_application_perma_link_account_requests
  (
    card_application_perma_link_id int FOREIGN KEY REFERENCES card_application_perma_links(card_application_perma_link_id),
    account_request_id int FOREIGN KEY REFERENCES account_requests(account_request_id),
    PRIMARY KEY (card_application_perma_link_id, account_request_id)
  )
