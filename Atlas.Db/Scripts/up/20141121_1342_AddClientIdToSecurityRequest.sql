
alter table security_requests add client_id int null
alter table security_requests add CONSTRAINT fk_security_requests_client_id FOREIGN KEY (client_id) REFERENCES Clients(client_id)
