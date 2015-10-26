CREATE TABLE account_requests
(
  account_request_id int identity NOT NULL primary key,
  requested_by integer NOT NULL,
  account_request_type nvarchar(max),
  account_request_status nvarchar(max),
)

CREATE TABLE account_request_account_changes
(
  account_request_id integer NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES account_requests(account_request_id),
  credit_limit numeric(16,4),
  transaction_limit numeric(16,4),
  atm_limit numeric(16,4),
  extra_data nvarchar(max),
  reversal_on date,
  cash_advance_limit numeric(16,4),
  from_date date null,
  to_date date null,
  destination nvarchar (200) not null,
  card_replacement_reason nvarchar(30),
  mcg_blocking_codes varchar(2000),
  mcc_blocking_codes varchar(2000)
)

CREATE TABLE account_request_accounts
(
  account_request_id integer NOT NULL FOREIGN KEY REFERENCES account_requests(account_request_id),
  account_id integer NOT NULL FOREIGN KEY REFERENCES accounts(account_id),
  CONSTRAINT account_request_accounts_pkey PRIMARY KEY (account_request_id, account_id)
)