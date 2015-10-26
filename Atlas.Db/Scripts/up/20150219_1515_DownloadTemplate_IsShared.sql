alter table download_templates
	drop constraint PK_download_templates;

alter table download_templates 
	add download_template_id int identity not null primary key,
	is_shared bit default 0,
	constraint ux_download_templates__user_id__name__template_type__is_shared unique (user_id, name, template_type, is_shared)