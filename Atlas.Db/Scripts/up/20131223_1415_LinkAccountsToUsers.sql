ALTER TABLE accounts DROP COLUMN last_name, first_name, email
ALTER TABLE accounts ADD user_id int NULL
ALTER TABLE accounts ADD CONSTRAINT	FK_accounts_users FOREIGN KEY (user_id) REFERENCES users(user_id)