USE master
GO

IF DB_ID('linq') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE linq
END
GO

CREATE DATABASE linq
ON PRIMARY
(NAME = 'linq.MDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\linq.MDF',
SIZE = 10MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 20%),

(NAME = 'linq.NDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\linq.NDF',
SIZE = 15MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%)

LOG ON
(NAME = 'linq.LDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\linq.LDF',
SIZE = 5MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5%)
GO

USE linq
GO

CREATE TABLE usuarios(
id_usuario VARCHAR(30) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) 
)
GO

-- Altas de usuario
CREATE PROC altas
	@id varchar(30),
	@nombre varchar(50),
	@msj varchar(50) out
	as begin
		if(exists(select * from usuarios where id_usuario=@id))
			set @msj = 'Usuario ya existente.'
		else
			begin
				insert into usuarios values(@id, @nombre)
					set @msj = 'Se guardo.'
			end
	end
go

-- Bajas de usuario
CREATE PROC eliminar
	@id varchar(30),
	@nombre varchar(50),
	@msj varchar(50) out
	as begin
		if(not exists(select * from usuarios where id_usuario=@id))
			set @msj = 'No existe el usuario.'
		else
			begin
				delete from usuarios where id_usuario=@id
					set @msj = 'Se borro.'
			end
	end
go

-- Buscar usuario
CREATE PROC buscar
	@id varchar(30),
	@msj varchar(50) out
	as begin
		if(not exists(select * from usuarios where id_usuario=@id))
			set @msj = 'No existe el usuario.'
		else
			begin
				select * from usuarios where id_usuario=@id
					set @msj = 'Usuario encontrado.'
			end
	end
go

-- Modificar Usuario
CREATE PROC modificar
	@id varchar(30), -- Cajas de texto -- parametro
	@nombre varchar(50), -- Cajas de texto -- parametro
	@msj varchar(50) out
	as begin
		if(not exists(select * from usuarios where id_usuario=@id))
			set @msj = 'No existe el usuario.'
		else
			begin
				update usuarios set nombre=@nombre where id_usuario=@id
					set @msj = 'Usuario modifico.'
			end
	end
go
