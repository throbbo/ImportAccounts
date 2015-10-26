alter table advanced_filter_templates
	drop constraint ux_advanced_filter_templates__user_id__name__search_type;

alter table advanced_filter_templates 
	add is_shared bit default 0,
	constraint ux_advanced_filter_templates__user_id__name__search_type__is_shared unique (user_id, name, search_type, is_shared)