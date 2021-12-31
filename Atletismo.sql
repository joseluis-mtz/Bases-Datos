-- USAR BASE DE DATOS MASTER
USE master

-- Verificaci�n 
IF DB_ID('atletismo') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE atletismo
END
GO
-- Creaci�n de la Base de Datos
CREATE DATABASE atletismo
ON PRIMARY
(NAME = 'atletismo_dat.mdf',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\atletismo_dat.mdf',
SIZE = 80MB,
MAXSIZE = 150mb,
FILEGROWTH = 5mb),

(NAME = 'atletismo_ndf.ndf',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\atletismo_ndf.ndf',
SIZE = 5MB,
MAXSIZE = 25mb,
FILEGROWTH = 5mb)

LOG ON
(NAME = 'atletismo_log.ldf',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\atletismo_log.lfd',
SIZE = 20MB,
MAXSIZE = 40mb,
FILEGROWTH = 5mb)
GO

-- Uso de la base de datos
USE atletismo
GO
-- Borrar la base de datos
use master
DROP DATABASE atletismo
GO
-- Creaci�n de las TABLAS
use atletismo
-- Crear la tabla competencia
CREATE TABLE competencia(
clave_c int NOT NULL PRIMARY KEY,
tipo_com varchar(45) NOT NULL,
fecha date NOT NULL,
)
GO
-- CAMBIAR NOMBRE A TABLA competencia
EXEC sp_rename 'competencia', 'disciplina'
GO
-- CAMBIAR NOMBRE A TABLA disciplina
EXEC sp_rename 'disciplina', 'competencia'
go
-- BORRAR TABLA
DROP TABLE competencia
go
-- AGREGAR CAMPO A LA TABLA
ALTER TABLE competencia
ADD atleta char(10) NOT NULL
go
-- BORRAR CAMPO DE TABLA
ALTER TABLE competencia
DROP COLUMN fecha
go
-- Modificando tipo de dato de atleta
ALTER TABLE competencia
ALTER COLUMN atleta varchar(10)
go
-- Modificando tipo de dato de atleta en su propiedad tama�o
ALTER TABLE competencia
ALTER COLUMN atleta varchar(50)
go
-- Modificando propiedad NULL de atleta
ALTER TABLE competencia
ALTER COLUMN atleta varchar(50) NULL
go
-- CAMBIAR NOMBRE DE ATRIBUTO
EXEC sp_rename 'competencia.tipo_com', 'tipo_competencia', 'column'
go
-- FINAL DEL SCRIP DEL EXAMEN