create table registration_activations (
	registration_activation_id int identity(1,1) not null
	,code_generated_date       datetime          not null
	,user_id                   int               not null FOREIGN KEY REFERENCES users(user_id)
	,email                     nvarchar(255)     not null
	,activation_code           nvarchar(10)      not null
	,success                   bit               not null
	,attempt                   int               null
	,activation_date           datetime          null
	,constraint registration_activations_pk primary key (registration_activation_id)
)

create unique index registration_activations_code_idx on registration_activations (activation_code, email)
