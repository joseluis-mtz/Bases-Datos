CREATE PROC elimina
(
	@id int
)
as
delete from alumnos where no_control = @id
go