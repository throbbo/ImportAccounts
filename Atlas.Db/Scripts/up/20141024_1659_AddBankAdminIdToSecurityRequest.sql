
alter table security_requests add bank_admin_id int null
alter table security_requests add CONSTRAINT fk_security_requests_bank_admin_id FOREIGN KEY (bank_admin_id) REFERENCES users(user_id)
