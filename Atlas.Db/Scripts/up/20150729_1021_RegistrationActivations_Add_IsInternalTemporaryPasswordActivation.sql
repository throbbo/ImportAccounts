alter table registration_activations add is_internal_temporary_password_activation bit null;
go

update registration_activations set is_internal_temporary_password_activation = 0 where is_internal_temporary_password_activation is null;
go

alter table registration_activations alter column is_internal_temporary_password_activation bit not null;
go