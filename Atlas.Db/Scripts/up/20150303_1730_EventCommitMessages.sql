create table event_commit_messages
(
	event_commit_message_id int identity primary key,
	bucket nvarchar(255) not null,
	stream nvarchar(255) not null,
	commit_date datetime not null,
	meta_data nvarchar(max) not null,
	[events] nvarchar(max) not null,
)

create index IX_event_commit_messages_stream on event_commit_messages(stream);