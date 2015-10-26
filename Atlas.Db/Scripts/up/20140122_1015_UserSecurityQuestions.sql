
create table user_security_questions (
	user_security_question_id     int identity primary key not null,
	user_id                       int not null FOREIGN KEY REFERENCES users(user_id),
	question_key         	      nvarchar(255) not null,
	question_text_user_defined    nvarchar(255) not null, 
	answer_text			          nvarchar(255) not null
);