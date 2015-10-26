create table help_videos (
    help_video_id int not null identity constraint pk_help_videos__help_video_id primary key,
    name nvarchar(500) not null,
    system_role int not null,
    provider nvarchar(20) not null,
    data nvarchar(1000) not null
)