CREATE DATABASE Agencia
GO

USE Agencia
GO

CREATE TABLE DUENO(
ID_DUENO INT PRIMARY KEY IDENTITY(1,1),
CALLE VARCHAR(70),
COLONIA VARCHAR(70),
MUNICIPIO VARCHAR(70),
ESTADO VARCHAR(70),
CORREO VARCHAR(70),
TELEFONO VARCHAR(70)
)
GO

CREATE TABLE SERVICIO(
ID_SERVICIO INT PRIMARY KEY IDENTITY(1,1),
ID_DUENO VARCHAR(70),
TIPO VARCHAR(70),
FECHA VARCHAR(70),
HORA VARCHAR(70),
COSTO VARCHAR(70),
ID_COCHE INT,
ID_EMPLEADO INT,
ID_PRODUCTO INT,
TOTAL INT
)
GO

CREATE TABLE COCHE(
ID_COCHE INT PRIMARY KEY IDENTITY(1,1),
MODELO VARCHAR(70),
COLOR VARCHAR(70),
SERIE VARCHAR(70),
AGNO VARCHAR(70),
ID_DUENO INT
)
GO

CREATE TABLE EMPLEADO(
ID_EMPLEADO INT PRIMARY KEY IDENTITY(1,1),
NOMBRE VARCHAR(70),
APARTERNO VARCHAR(70),
AMATERNO VARCHAR(70),
CALLE VARCHAR(70),
COLONIA VARCHAR(70),
NUMERO_CASA INT,
TELEFONO VARCHAR(70),
DEPARTAMENTO VARCHAR(70),
TIPO VARCHAR(70)
)
GO

CREATE TABLE PRODUCTOS(
ID_PRODUCTO INT PRIMARY KEY IDENTITY(1,1),
NOMBRE VARCHAR(70),
CANTIDAD INT,
PRECIO INT,
NO_PARTE VARCHAR(70),
ID_PROVEEDOR INT
)
GO

CREATE TABLE DETALLE_SERVICIO(
ID_DETALLE_SERVICIO INT PRIMARY KEY IDENTITY(1,1),
ID_SERVICIO INT
)
GO

CREATE TABLE VENTAS(
ID_VENTA INT PRIMARY KEY IDENTITY(1,1),
ID_CLIENTE INT,
ID_EMPLEADO INT,
FECHA VARCHAR(70),
TOTAL INT,
HORA VARCHAR(70),
TIPO VARCHAR(70)
)
GO

CREATE TABLE DETALLE_VENTA(
ID_DETALLE_VENTA INT PRIMARY KEY IDENTITY(1,1),
ID_VENTA INT
)
GO

CREATE TABLE PROVEEDOR(
ID_PROVEEDOR INT PRIMARY KEY IDENTITY(1,1),
NOMBRE VARCHAR(70),
ID_PRODUCTO INT,
CANTIDAD INT
)
GO

CREATE TABLE CREDITOS(
ID_CREDITO INT PRIMARY KEY IDENTITY(1,1),
ID_CLIENTE INT,
MONTO INT,
PLAZO INT,
ESTADO VARCHAR(70)
)
GO

CREATE TABLE PAGOS(
ID_PAGO INT PRIMARY KEY IDENTITY(1,1),
ID_CREDITO INT,
CANTIDAD INT
)
GO