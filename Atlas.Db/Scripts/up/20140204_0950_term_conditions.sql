
create table terms_and_conditions_versions(
	terms_and_conditions_version_id int not null identity primary key,
	html varchar(max),
	system_role int,
	culture  nvarchar(5) not null,
	terms_and_conditions_version_key nvarchar(25)
)

create table user_terms_and_conditions_versions(
	user_id int not null foreign key references users(user_id),
	terms_and_conditions_version_id int not null foreign key references terms_and_conditions_versions(terms_and_conditions_version_id),
	CONSTRAINT user_terms_and_conditions_versions_pk PRIMARY KEY (user_id, terms_and_conditions_version_id)
)

