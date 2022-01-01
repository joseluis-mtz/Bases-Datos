-- Verificación de Existencia y Creación de la Base de Datos
-- USAR BASE DE DATOS MASTER
USE master
GO
-- Verificación 
IF DB_ID('bddojan') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE bddojan
END
GO
-- Creación de la Base de Datos
CREATE DATABASE bddojan
ON PRIMARY
(NAME = 'bddojan.MDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bddojan.MDF',
SIZE = 40MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 20%),

(NAME = 'bddojan.NDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bddojan.NDF',
SIZE = 20MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%)

LOG ON
(NAME = 'bddojan.LDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bddojan.LDF',
SIZE = 15MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5%)
GO

-- Uso de la base de datos para crear tablas
USE bddojan
GO
-- Creación de Tablas

-- Usuarios
CREATE TABLE usuarios(
id_user_profe INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
--CAMBIAR TIPO DE DATO DE LA PASS!!!!!!!!!!!!!
--contrasena NVARCHAR(MAX) NOT NULL)
contrasena VARBINARY(128) NOT NULL)
GO

-- Alumnos
CREATE TABLE alumnos(
no_control INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombres NVARCHAR(MAX) NOT NULL,
apellidos NVARCHAR(MAX) NOT NULL,
direccion NVARCHAR(MAX) NOT NULL,
ciudad NVARCHAR(MAX) NOT NULL,
telefono_casa NVARCHAR(MAX) NULL DEFAULT('No Tiene Telefono de Casa'),
celular NVARCHAR(MAX) NOT NULL,
correo NVARCHAR(MAX) NOT NULL,
fecha_nacimiento NVARCHAR(MAX) NOT NULL,
sexo NVARCHAR(MAX) NOT NULL,
grado NVARCHAR (MAX) NOT NULL)
GO

-- Examenes
CREATE TABLE examenes(
id_examen INT NOT NULL PRIMARY KEY IDENTITY (1,1),
fecha_aplicacion NVARCHAR(MAX) NOT NULL,
fecha_peticion NVARCHAR(MAX) NOT NULL,
costo NVARCHAR(MAX) NOT NULL,
grado_actual NVARCHAR(MAX) NOT NULL,
grado_a_pasar NVARCHAR(MAX) NOT NULL,
no_control INT NOT NULL,
id_user_profe INT NOT NULL
)
GO

-- Reportes
-- Tipos de Reporte: De alumnos, De Examenes, 
CREATE TABLE reportes(
id_reporte INT NOT NULL PRIMARY KEY IDENTITY (1,1),
-- Quien lo genera
id_user_profe INT NOT NULL,
hora_generacion NVARCHAR(MAX) NOT NULL,
tipo_reporte NVARCHAR(MAX) NOT NULL
)
GO

-- RELACIONES ENTRE TABLAS

--Relacion ENTRE alumnos y examenes
ALTER TABLE examenes
ADD CONSTRAINT FK_ALUMNOS_EXAMENES
FOREIGN KEY (no_control) REFERENCES alumnos(no_control)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

-- Relación entre usuarios y reportes
ALTER TABLE reportes
ADD CONSTRAINT FK_USUARIOS_REPORTES
FOREIGN KEY (id_user_profe) REFERENCES usuarios(id_user_profe)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

-- Relación entre usuarios y examenes
ALTER TABLE examenes
ADD CONSTRAINT FK_USUARIOS_EXAMENES
FOREIGN KEY (id_user_profe) REFERENCES usuarios(id_user_profe)
ON UPDATE NO ACTION
ON DELETE NO ACTION
GO
--REGISTROS
--Registro de Usuario por defecto:
INSERT INTO usuarios(nombre_usuario,contrasena) VALUES('admin', PWDENCRYPT('admin'));
GO