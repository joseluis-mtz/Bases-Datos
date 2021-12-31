USE master
GO

IF DB_ID('Gestor') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE Gestor
END
GO

CREATE DATABASE Gestor
ON PRIMARY
(NAME = 'Gestor.mdf',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Gestor.mdf',
SIZE = 10MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 20%),

(NAME = 'Gestor.ndf',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Gestor.ndf',
SIZE = 15MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%)

LOG ON
(NAME = 'Gestor.ldf',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Gestor.ldf',
SIZE = 5MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5%)
GO

USE Gestor
GO

CREATE TABLE clientes(
id_clientes INT NOT NULL PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50),
tipo INT,
fecha_nacimiento DATE,
estado BIT
)
GO

-- Guardado de clientes
CREATE PROC guardarClientes
	@id INT,
	@nombre VARCHAR(50),
	@tipo INT,
	@fecha DATE,
	@estado BIT,
	@msj VARCHAR(50) OUTPUT
	AS BEGIN
		IF(EXISTS(SELECT * FROM clientes WHERE id_clientes=@id))
			UPDATE clientes set nombre=@nombre, tipo=@tipo, fecha_nacimiento=@fecha, estado=@estado where id_clientes=@id
		ELSE
			BEGIN
				INSERT INTO clientes(nombre, tipo, fecha_nacimiento, estado) values(@nombre, @tipo, @fecha, @estado)
				SET @msj = 'El registro del cliente fue guardado.'
			END
	END
GO

-- Bajas de Clientes
CREATE PROC eliminarClientes
	@id INT,
	@nombre varchar(50),
	@msj varchar(50) output
	as begin
		if(not exists(select * from clientes where id_clientes=@id))
			set @msj = 'No se encontró el cliente.'
		else
			begin
				delete from clientes where id_clientes=@id
					set @msj = 'El cliente se ha eliminado correctamente.'
			end
	end
go

CREATE PROC eliminarClientesDesactivando
	@id INT,
	@estado BIT,
	@msj varchar(50) output
	as begin
		if(not exists(select * from clientes where id_clientes=@id))
			set @msj = 'El cliente no se ha encontrado.'
			
		else
		begin
			UPDATE clientes set estado=@estado where id_clientes=@id
			set @msj = 'El cliente se ha eliminado correctamente.'
		end

	end
go

-- Buscar cliente
CREATE PROC buscarCliente
	@id INT,
	@nombre varchar(50),
	@estado BIT,
	@msj varchar(50) output
	as begin
		if(not exists(select * from clientes where id_clientes=@id AND estado=@estado))
			set @msj = 'Cliente no encontrado'
		else
			begin
				select * from clientes where id_clientes=@id
					set @msj = 'El cliente fue encontrado.'
			end
	end
go

CREATE PROC buscarClienteCoincidencia
	@nombre varchar(50),
	@estado BIT,
	@msj varchar(50) output
	as begin
		if(exists(select * from clientes WHERE nombre LIKE @nombre  AND estado=@estado))
			set @msj = 'Cliente encontrado'
		else
			set @msj = 'El cliente no fue encontrado.'
	end
go

-- Modificar Usuario---------------------------------- OBSOLETO ------------------------------------------------------
CREATE PROC modificar
	@id varchar(30), -- Cajas de texto -- parametro
	@nombre varchar(50), -- Cajas de texto -- parametro
	@msj varchar(50) out
	as begin
		if(not exists(select * from usuarios2 where id_usuario=@id))
			set @msj = 'No existe el usuario.'
		else
			begin
				update usuarios2 set nombre=@nombre where id_usuario=@id
					set @msj = 'Usuario modifico.'
			end
	end
go
