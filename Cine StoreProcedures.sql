-- CREACIÓN DE LA BASE DE DATOS
create database Peliculas_Salas
use Peliculas_Salas

-- CREACIÓN DE LAS TABLAS
create table Peliculas
(
 Codigo_Pelicula int not null Primary key identity(1,1),
 Nombre_Pelicula varchar(100) not null,
 Calificacion decimal(2,1) not null,
 Edad int not null
)

create table Salas
(
 Codigo_Sala int not null Primary Key identity(1,1),
 Nombre_Sala varchar(100) not null,
 Codigo_Pelicula int not null
)

-- CREACIÓN DE LA RELACIÓN
ALTER TABLE Salas
ADD CONSTRAINT FK_SALAS_PELICULAS
FOREIGN KEY (Codigo_Pelicula) REFERENCES Peliculas(Codigo_Pelicula)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

-- INSERCIÓN DE LOS VALORES POR DEFECTO O REGISTROS
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Anabelle',5,15)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Hazlo como hombre',4,15)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Eso',4.5,18)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Los 3 idiotas',5,0)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Emoji',0,0)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Las aventuras del capitán calzoncillos',3.5,0)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Duro de cuidar',3,15)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('Locos poras nueces ',2.5,0)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('El renacido',5,15)
insert into Peliculas(Nombre_Pelicula,Calificacion,Edad) values('La pasión de Cristo',3,0)

insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('3D',1)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Junior',4)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Macro',2)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Normal',3)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Normal',6)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('3D',8)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Junior',5)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Macro',9)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('3D',7)
insert into Salas(Nombre_Sala,Codigo_Pelicula) values ('Macro',10)
GO
----------------------------- PROCEDIMIENTOS ALMACENADOS ----------------------------------------------
-- Guardado de peliculas
CREATE PROC guardarPeliculas
	@id INT,
	@Nombre_Pelicula VARCHAR(100),
	@Calificacion decimal(2,1),
	@Edad int,
	@msj VARCHAR(50) OUTPUT
	AS BEGIN
		IF(EXISTS(SELECT * FROM Peliculas WHERE Codigo_Pelicula=@id))
			UPDATE Peliculas set Nombre_Pelicula=@Nombre_Pelicula, Calificacion=@Calificacion, Edad=@Edad where Codigo_Pelicula=@id
		ELSE
			BEGIN
				INSERT INTO Peliculas(Nombre_Pelicula, Calificacion, Edad) values(@Nombre_Pelicula, @Calificacion, @Edad)
				SET @msj = 'El registro fue guardado correctamente.'
			END
	END
GO

-- Bajas de peliculas
CREATE PROC eliminarPeliculas
	@id INT,
	@msj varchar(50) output
	as begin
		if(not exists(select * from Peliculas where Codigo_Pelicula=@id))
			set @msj = 'No se encontró la película.'
		else
			begin
				delete from Peliculas where Codigo_Pelicula=@id
					set @msj = 'La película se ha eliminado correctamente.'
			end
	end
go

-- Busqueda de peliculas
CREATE PROC buscarPeliculaCoincidencia
	@ParametroBuscar VARCHAR(100),
	@msj varchar(50) output
	as begin
		select Codigo_Pelicula, Nombre_Pelicula, Calificacion, Edad from Peliculas WHERE Nombre_Pelicula LIKE @ParametroBuscar OR Calificacion LIKE @ParametroBuscar OR Edad LIKE @ParametroBuscar
			set @msj = 'Película encontrada.'
	end
go

-- Guardado de salas
CREATE PROC guardarSalas
	@id INT,
	@Nombre_Sala VARCHAR(100),
	@Codigo_Pelicula INT,
	@msj VARCHAR(50) OUTPUT
	AS BEGIN
		IF(EXISTS(SELECT * FROM Salas WHERE Codigo_Sala=@id))
			UPDATE Salas set Nombre_Sala=@Nombre_Sala, Codigo_Pelicula=@Codigo_Pelicula where Codigo_sala=@id
		ELSE
			BEGIN
				INSERT INTO Salas(Nombre_Sala, Codigo_Pelicula) values(@Nombre_Sala, @Codigo_Pelicula)
				SET @msj = 'El registro fue guardado correctamente.'
			END
	END
GO

-- Bajas de SALAS
CREATE PROC eliminarSalas
	@id INT,
	@msj varchar(50) output
	as begin
		if(not exists(select * from Salas where Codigo_Sala=@id))
			set @msj = 'No se encontró la sala.'
		else
			begin
				delete from Peliculas where Codigo_Pelicula=@id
					set @msj = 'La sala se ha eliminado correctamente.'
			end
	end
go

-- Busqueda de salas
CREATE PROC buscarSalaCoincidencia
	@Nombre_Sala VARCHAR(100),
	@msj varchar(50) output
	as begin
		select Codigo_Sala, Nombre_Sala, Codigo_Pelicula from Salas WHERE Nombre_Sala LIKE @Nombre_Sala
			set @msj = 'Sala encontrada.'
	end
go

-- Buscar General
CREATE PROC buscarGeneral

	@msj varchar(50) out
	
	as begin
		select Peliculas.Codigo_Pelicula as [Código de película], Peliculas.Nombre_Pelicula as [Nombre de la película], Peliculas.Calificacion as [Calificacion], Peliculas.Edad as [Edad], Salas.Codigo_Sala as [Código de sala], Salas.Nombre_Sala as [Sala] from Peliculas INNER JOIN Salas ON Peliculas.Codigo_Pelicula = Salas.Codigo_Pelicula
			set @msj = 'Datos encontrados.'
	end
go

-- Buscar General Salas
CREATE PROC buscarGeneralSalas

	@msj varchar(50) out
	
	as begin
		select Codigo_Sala, Nombre_Sala, Codigo_Pelicula from Salas 
			set @msj = 'Datos encontrados.'
	end
go

select * from Salas
select * from Peliculas