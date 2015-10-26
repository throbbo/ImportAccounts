create table client_settings(
    client_id int NOT NULL FOREIGN KEY REFERENCES clients(client_id) primary key,
    settings nvarchar(max)
)