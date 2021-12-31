-- BASE DE DATOS PARA EL CONTROL DE PRESENTACIONES MUSICALES DE LA BANDA MS
-- Verificació de existencia de la base de datos
IF DB_ID('controlms') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE controlms
END
GO
-- Creación de la base de datos en blanco
CREATE DATABASE controlms

ON PRIMARY (
	NAME = 'controlms.mdf',
	FILENAME = 'F:\BASES DE DATOS SQL SERVER 2012\control_ms\controlms.mdf',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 10MB
), (
        NAME = 'controlms.ndf',
	FILENAME = 'F:\BASES DE DATOS SQL SERVER 2012\control_ms\controlms.ndf',
	SIZE = 10MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
)
LOG ON (
	NAME = 'controlms_log.ldf',
	FILENAME = 'F:\BASES DE DATOS SQL SERVER 2012\control_ms\controlms_log.ldf',
	SIZE = 5MB,
	MAXSIZE = 20MB,
	FILEGROWTH = 10%
)
GO

-- Activar base de datos
USE controlms

-- Implementación de Tablas
-- Creción de la tabla INTEGRANTES
CREATE TABLE integrantes(
id_integrante tinyint NOT NULL PRIMARY KEY,
nombre varchar(40) NOT NULL,
apellido_paterno varchar(30) NOT NULL,
apellido_materno varchar(30) NOT NULL,
edad char(2) NOT NULL,
telefono char(10) NOT NULL,
correo varchar(50) NOT NULL,
direccion varchar(250) NULL,
Sexo char(20) NOT NULL,
no_instrumento smallint NOT NULL
)

-- Creación de tabla INSTRUMENTOS
CREATE TABLE instrumentos (
no_instrumento smallint NOT NULL PRIMARY KEY,
nombre varchar(35) NOT NULL,
tamano char(20) NULL,
descripcion varchar(250) NULL,
color char(20) NULL,
origen varchar(40) NOT NULL,
garantia varchar(250) NULL
)

-- Creación de tabla TRANSPORTE
CREATE TABLE transporte (
matricula smallint NOT NULL PRIMARY KEY,
nombre varchar(30) NOT NULL,
tipo varchar(50) NOT NULL,
tamano char(15) NULL,
combustible varchar(30) NOT NULL,
nacionalidad varchar(40) NOT NULL,
color char(20) NULL,
id_integrante tinyint NOT NULL
)

-- Creación de tabla LUGARES
CREATE TABLE lugares (
no_lugar int NOT NULL PRIMARY KEY,
nombre varchar(40) NOT NULL,
tipo char(15) NOT NULL,
direccion varchar(250) NOT NULL,
codigo_postal char(5) NOT NULL,
encargado varchar(70) NOT NULL,
fecha_presentacion date NOT NULL,
no_escenario tinyint NOT NULL,
id_integrante tinyint NOT NULL,
matricula smallint NOT NULL
)

-- Creación de tabla ESCENARIOS
CREATE TABLE escenarios (
no_escenario tinyint NOT NULL PRIMARY KEY,
tamano char(15) NOT NULL,
escenografia varchar(250) NULL,
dueno varchar(60) NOT NULL,
disponible char(2) NOT NULL,
color char(20) NOT NULL,
precio_renta money NOT NULL,
id_integrante tinyint NOT NULL
)