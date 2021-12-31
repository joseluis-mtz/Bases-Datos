USE master
GO

CREATE DATABASE seminuevos
GO

USE seminuevos
GO

CREATE TABLE personas(
id_persona INT PRIMARY KEY NOT NULL IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
edad VARCHAR(2) NOT NULL,
ciudad VARCHAR(40),
id_carro INT NOT NULL
)
GO

CREATE TABLE carros(
id_carro INT PRIMARY KEY NOT NULL IDENTITY(1,1),
carro VARCHAR(50)
)
GO

ALTER TABLE personas
ADD CONSTRAINT FK_PERSONAS_CARROS
FOREIGN KEY (id_carro) REFERENCES carros(id_carro)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

INSERT INTO carros(carro) VALUES('Tsuru'),
('Sentra'),
('Versa'),
('March')
GO

-- CREAR ALTAS DE PERSONAS
CREATE PROC registrar
@nombre varchar(50),
@edad varchar(50),
@ciudad  varchar(50),
@id_carro int,
@msj varchar(50) out
	as begin
		insert into personas(nombre, edad, ciudad, id_carro) values(@nombre, @edad, @ciudad, @id_carro)
		set @msj = 'Los datos fueron guardados.'
	end
go

-- CREAR BAJAS DE PERSONAS
CREATE PROC eliminar
@id_persona int,
@msj varchar(50) out
	as begin
		if(not exists(select * from personas where id_persona=@id_persona))
			set @msj = 'El registro no existe.'
		else
			begin
				delete from personas where id_persona=@id_persona
					set @msj = 'Datos eliminados correctamente.'
			end
	end
go

-- CREAR LA ACTUALIZACIÓN DE PERSONAS
CREATE PROC actualizar
@id_persona int,
@nombre varchar(50),
@edad varchar(50),
@ciudad  varchar(50),
@id_carro int,
@msj varchar(50) out
	as begin
		if(not exists(select * from personas where id_persona=@id_persona))
			set @msj = 'El registro no existe.'
		else
			begin
				update personas set nombre=@nombre, edad=@edad, ciudad=@ciudad, id_carro=@id_carro where id_persona=@id_persona
					set @msj = 'Los datos se modificaron de forma correcta.'
			end
	end
go

-- CREAR LA BUSQUEDA DE LOS DATOS DE LAS PERSONAS
CREATE PROC buscarP

	@msj varchar(50) out
	
	as begin
		select id_persona, nombre, edad, ciudad, carro from personas INNER JOIN carros ON personas.id_carro = carros.id_carro
			set @msj = 'Datos encontrados.'
	end
go

CREATE PROC buscarSolo
	@id_persona int,
	@msj varchar(50) out
	
	as begin
		select id_persona, nombre, edad, ciudad, carros.id_carro from personas INNER JOIN carros ON personas.id_carro = carros.id_carro WHERE id_persona=@id_persona
		set @msj = 'Datos encontrados.'
	end
go

-- CREAR BUSQUEDA DE CARROS
CREATE PROC buscarC

	@msj varchar(50) out
	
	as begin
		select * from carros 
			set @msj = 'Datos encontrados.'
	end
go