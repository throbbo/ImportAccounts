CREATE TABLE emails
(
	email_id int identity NOT NULL PRIMARY KEY,
	from_address nvarchar(1000) NULL,
	to_address nvarchar(1000) NOT NULL,
	cc_address nvarchar(1000) NULL,
	bcc_address nvarchar(1000) NULL,
	attachments nvarchar(1000) NULL,
	subject nvarchar(500) NOT NULL,
	is_html_body bit NOT NULL,
	body nvarchar(max) NOT NULL,
	date_successfully_sent datetime NULL
)

CREATE TABLE email_attempts
(
	email_attempt_id int identity NOT NULL PRIMARY KEY,
	email_id int NOT NULL FOREIGN KEY REFERENCES emails(email_id),
	date_attempted datetime NOT NULL,
	error nvarchar(max) NOT NULL
)