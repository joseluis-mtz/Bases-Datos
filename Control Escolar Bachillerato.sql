-- Verificación de Existencia y Creación de la Base de Datos

-- USAR BASE DE DATOS MASTER
USE master
GO
-- Verificación 
IF DB_ID('bdcontrolescolar') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE bdcontrolescolar
END
GO
-- Creación de la Base de Datos
CREATE DATABASE bdcontrolescolar
ON PRIMARY
(NAME = 'bdcontrolescolar.MDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdcontrolescolar.MDF',
SIZE = 40MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 20%),

(NAME = 'bdcontrolescolar.NDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdcontrolescolar.NDF',
SIZE = 20MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%)

LOG ON
(NAME = 'bdcontrolescolar.LDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdcontrolescolar.LDF',
SIZE = 15MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5%)
GO

-- Uso de la base de datos para crear tablas
USE bdcontrolescolar
GO

-- CREACIÓN DE LAS TABLAS
CREATE TABLE usuarios(
id_user_profe INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre_usuario NVARCHAR(MAX) NOT NULL,
contrasena VARBINARY(128) NOT NULL,
tipo NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE profesores(
id_profe INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombres NVARCHAR(MAX) NOT NULL,
apellidos NVARCHAR(MAX) NOT NULL,
sexo NVARCHAR(MAX) NOT NULL,
direccion NVARCHAR(MAX) NOT NULL,
ciudad NVARCHAR(MAX) NOT NULL,
id_pais NVARCHAR(MAX) NOT NULL,
id_estado NVARCHAR(MAX) NOT NULL,
telefono_casa NVARCHAR(MAX) NULL DEFAULT('No Tiene Telefono de Casa'),
celular NVARCHAR(MAX) NOT NULL,
estado_trabajo NVARCHAR(MAX) NOT NULL,
id_user_profe INT NULL)
GO

CREATE TABLE alumnos(
no_control INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombres NVARCHAR(MAX) NOT NULL,
apellidos NVARCHAR(MAX) NOT NULL,
direccion NVARCHAR(MAX) NOT NULL,
ciudad NVARCHAR(MAX) NOT NULL,
id_pais NVARCHAR(MAX) NOT NULL,
id_estado NVARCHAR(MAX) NOT NULL,
telefono_casa NVARCHAR(MAX) NULL DEFAULT('No Tiene Telefono de Casa'),
celular NVARCHAR(MAX) NOT NULL,
correo NVARCHAR(MAX) NOT NULL,
fecha_nacimiento NVARCHAR(MAX) NOT NULL,
sexo NVARCHAR(MAX) NOT NULL,
id_aula NVARCHAR(MAX) NOT NULL,
grupo NVARCHAR(MAX) NOT NULL,
id_grado NVARCHAR(MAX) NOT NULL,
id_curso NVARCHAR(MAX) NOT NULL,
id_escuela NVARCHAR(MAX) NOT NULL
)
GO

CREATE TABLE cursos(
id_curso INT NOT NULL PRIMARY KEY IDENTITY (1,1),
id_profe NVARCHAR(MAX) NOT NULL,	
id_aula NVARCHAR(MAX) NOT NULL,
id_grado NVARCHAR(MAX) NOT NULL,
id_materia NVARCHAR(MAX) NOT NULL,
id_taller NVARCHAR(MAX) NULL DEFAULT('NO SE ASIGNO TALLER'),
fecha_inicio NVARCHAR(MAX) NOT NULL,
fecha_fin NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE calificaciones(
id_calificacion INT NOT NULL PRIMARY KEY IDENTITY (1,1),
no_control INT NOT NULL,
id_materia NVARCHAR(MAX) NOT NULL,
calificacion INT NOT NULL)
GO

CREATE TABLE escuelas(
id_escuela INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre NVARCHAR(MAX) NOT NULL,
tipo NVARCHAR(MAX) NOT NULL,
nivel_escolar NVARCHAR(MAX) NOT NULL,
director NVARCHAR(MAX) NOT NULL,
ubicacion NVARCHAR(MAX) NOT NULL,
telefono NVARCHAR(MAX) NOT NULL,
correo NVARCHAR(MAX) NOT NULL,
pagina_web NVARCHAR(MAX) NULL DEFAULT('SIN PÁGINA WEB'),)
GO

CREATE TABLE comentarios(
id_comentario INT NOT NULL PRIMARY KEY IDENTITY (1,1),
comentario  NVARCHAR(MAX) NOT NULL)
GO

--RELACIÓN ENTRE PROFESORES Y USUARIOS
ALTER TABLE profesores
ADD CONSTRAINT FK_PROFESORES_USUARIOS
FOREIGN KEY (id_user_profe) REFERENCES usuarios(id_user_profe)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--REGISTROS PRECARGADOS
INSERT INTO usuarios(nombre_usuario, contrasena, tipo) VALUES('MASTER', PWDENCRYPT('123'), 'SUPER USUARIO')
INSERT INTO usuarios(nombre_usuario, contrasena, tipo) VALUES('1', PWDENCRYPT('1'), 'MAESTRO')
INSERT INTO usuarios(nombre_usuario, contrasena, tipo) VALUES('PROFE', PWDENCRYPT('123'), 'MAESTRO')
select * from usuarios
GO

INSERT INTO profesores VALUES('Juan Luis', 'Roa Mares', 'MASCULINO', 'PRL MINA S/N, PIRULES, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4621597532', '4296937412', 'ACTIVO', 1)
GO
INSERT INTO profesores VALUES('Javier', 'Salazar Moreno', 'MASCULINO', 'CLL 16 DE SEPTIEMBRE 200, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4291231321', '4296645312', 'ACTIVO', 2)
GO
INSERT INTO profesores VALUES('Julian', 'Roa Mares', 'MASCULINO', 'BLVD CUITZEO DE LOS NARANJOS 401, LAS MARGARITAS, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4294455621', '4623216555', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Juan Antonio', 'Prado Pardo', 'MASCULINO', 'CLL JOSE MA MORELOS 224, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4294321481', '4621370137', 'NO ACTIVO', null)
GO
INSERT INTO profesores VALUES('José', 'Salazar Nuñez', 'MASCULINO', 'CLL MIGUEL MA ECHEGARAY 308, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4298887355', '4297653979', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Ramón', 'Moreno García', 'MASCULINO', 'CLL AGUSTIN MELGAR 126, LA MORA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4296543279', '4623457231', 'NO ACTIVO', null)
GO
INSERT INTO profesores VALUES('Roman', 'Gonzalez Lara', 'MASCULINO', 'CLL ECHEGARAY 600, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4295636517', '4298765189', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Jacinto', 'Tafolla Granados', 'MASCULINO', 'CLL GUERRERO 106, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4651232134', '5446541564', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Oscar', 'Torres Granados', 'MASCULINO', 'CLL 5 DE MAYO 103, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4296565448', '4295646546', 'NO ACTIVO', null)
GO
INSERT INTO profesores VALUES('Alfredo', 'Mares Mireles', 'MASCULINO', 'CLL GUERRERO 108, LA CUBANA, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4297894453', '4298779979', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Adrian', 'Rodriguez Gutierrez', 'MASCULINO', 'ZARAGOZA N o.113, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4297978797', '4295468897', 'NO ACTIVO', null)
GO
INSERT INTO profesores VALUES('Rodolfo', 'Guerrero Vaca', 'MASCULINO', 'COL VICENTE GUERRERO, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4621546545', '4627984651', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Arturo', 'Mijares Molina', 'MASCULINO', 'ECHEGARAY No.601 SUR, ABASOLO, GTO.', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4695421231', '4589632147', 'NO ACTIVO', null)
GO
INSERT INTO profesores VALUES('Uriel', 'Santillan García', 'MASCULINO', 'COLONIA SANTA MARÍA, CALLE LUCIA #345', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4587989789', '4621654874', 'ACTIVO', null)
GO
INSERT INTO profesores VALUES('Juan', 'Hurtado Roa', 'MASCULINO', 'Colonia Marcosar Calle Pedro #12', 'ABASOLO', 'MÉXICO','GUANAJUATO', '4295465787', '4577974121', 'ACTIVO', null)
GO

INSERT INTO cursos VALUES('Juan', 'Aula 1', 'PRIMER GRADO 1°','ESPAÑOL', 'COMPUTACIÓN', '12/12/2014', '12/12/2015')
GO

INSERT INTO alumnos VALUES('Julian', 'Prado', 'LOMAS DE SANTA MARIA CALLE JALISCO #444', 'ABASOLO', 'MÉXICO','ESTADO', '1234567890', '0987654321', 'julprad0@hotmail.com', '12/12/1998', 'MASCULINO','Aula 1','E','PRIMER GRADO 1°','CURSO','José Maria Morelos')
GO

INSERT INTO calificaciones VALUES(1,'ESPAÑOL',10)
GO

INSERT INTO comentarios VALUES('El programa está excelente.')

INSERT INTO escuelas(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web)
VALUES('Benito Juarez', 'Pública', 'Basico', 'Javier Camarillo Duarte', 'Estacion Joaquin', '4291139023', 'benijua@hotmail,com', 'www,benitojuarez.gob.mx'),
('Justo Sierra', 'Pública', 'Basico', 'Luis Martinez Luna', 'Estacion Joaquin', '4291236453', 'justsie@hotmail.com', 'www,justosier.gob.mx'),
('Nicolas Bravo', 'Pública', 'Basico', 'Sonia Ramirez Beltran', 'Calle Bolaños#45', '4299364574', 'nicobrav@hotamail.com', 'www,nicolasbrav.gob.mx'),
('Emiliano Zapata', 'Pública', 'Basico', 'Ramon Vargas Noriega', 'Calle 20Sep#70', '4625437634', 'emilizap@hotmail.com', 'www.emilizap.gob.mx'),
('Josefa Ortiz De Dominguez', 'Pública', 'Basico', 'Maria Leon Cervantes', 'Calle Degollado#45', '4299074567', 'joseort@hotmail.com', 'www.joseort.gob.mx'),
('Heroes De Chapultepec', 'Pública', 'Basico', 'Jose Martinez Ceballos', 'Calle Alba#12', '4621345564', 'heroeschap@hotmail.com', 'www.heroeschapul.gob.mx'),
('Ignacio Allende', 'Pública', 'Basico', 'Fernando Ramirez HUerta', 'Calle Mina#78', '4293456789', 'ignacioalle@hotmail.com', 'www.ignacioalle.gob.mx'),
('Juan Escutia', 'Pública', 'Basico', 'Rosa Contreras Mendez', 'Calle Degollado#48', '4291234567', 'juanescut@hotmail.com', 'www.juanescutia.gob.mx'),
('Carmen Ramos Del Rio', 'Pública', 'Basico', 'David Morales Juarez', 'Calle Valle#26', '4292357890', 'carmenram@hotmail.com', 'www.carmenramos.gob.mx'),
('Francisco I Madero', 'Pública', 'Basico', 'Manuel Cervantes Rios', 'Calle Bolaños#49', '4629074567', 'francismad@hotmail.com', 'www.franciscomader.gob.mx'),
('20 de Noviembre', 'Pública', 'Basico', 'Diana Luna Ponce', 'Calle Salazar#72', '429564237', '20nov@hotmail.com', 'www.20noviem.gob.mx'),
('18 de Marzo', 'Pública', 'Basico', 'Raul Mendez Rojas', 'Calle Alba#19', '4292094523', '18marz@hotmail.com', 'www.1marzo.gob.mx'),
('Las Naciones Unidas', 'Pública', 'Basico', 'Natalia Aguirre Galvan', 'Calle 20Sep#78', '4298756356', 'naciuni@hotmail.com', 'nacionunid.gob.mx'),
('Lazaro Cardenas', 'Pública', 'Basico', 'Juan Zavala Rios', 'Calle Valle#25', '429123456', 'lazcard@hotmail.com', 'www.lazcarde.gob.mx'),
('Benisario Dominguez', 'Pública', 'Basico', 'Dana Elizarraraz Noriega', 'Calle Guadalupe#62', '4621876530', 'benidom@hotmail.com', 'benisadomin.gob.mx'),
('Cuahutemoc', 'Pública', 'Basico', 'Alan Rocha Gonzalez', 'Calle Guadalupe#55', '462965643', 'cuahu@hotmail.com', 'www.cuahutemoc.gob.mx'),
('Miguel Hidalgo', 'Pública', 'Basico', 'Teresa Martinez Bravo', 'Calle Salazar#78', '4297654439', 'miguehidal@hotmail.com', 'www.miguelhidal.gob.mx'),
('Morelos I Pavon', 'Pública', 'Basico', 'Elena Gonzalez Balandran', 'Calle Bolaños#23', '429145679', 'morelpav@hotmail.com', 'www.morelosipav.gob.mx'),
('Benustiano Carranza', 'Pública', 'Basico', 'Susana Elizarraraz Rosales', 'Calle Matamoros#45', '42931256709', 'benustcarran@hotmail.com', 'www.benustianocarranza.gob.mx'),
('Benito Juarez', 'Pública', 'Basico', 'Rubi Ramirez Guerra', 'Calle Roma#74', '4620985674','benitojuarez@hotmail.com', 'www.benitojuarez.gob.mx'),
('Ignacio Allende', 'Pública', 'Basico', 'Carla rodriguez Gonzalez', 'Calle Morelos#34', '4291003608', 'ignallen@hotmail.com', 'www.ignacioallende.gob.mx'),
('Carlos Cortes', 'Pública', 'Basico', 'Elizabeth Ramirez Hernandez', 'Calle Mina#78', '4621456709', 'carlocort@hotmsil.com', 'www.crloscortes.gob.mx'),
('Macrina', 'Pública', 'Basico', 'Liliana Gonzalez Nuñez', 'Calle Troya#48', '429456723', 'macrina@hotmail.com', 'www.macrina,gob.mx'),
('Miguel Hidalgo', 'Pública', 'Basico', 'Elia Guerrero Noriega', 'Calle Italia#40', '4291023465', 'miguelhidal@hotmail.com', 'www.miguelhidalgo.gob.mx'),
('Guadalupe Victoria', 'Pública', 'Basico', 'Fabian Alcantar Guerrero', 'Calle Matamoros#49', '4624539078', 'guadalupvic@hotmail.com', 'www.guadalupevictori.gob.mx'),
('Pancho Villa', 'Pública', 'Basico', 'Leonor Guerra Rojas', 'Calle Italia#45', '4291236798', 'panchov@hotmail.com', 'www.panchovilla.gob.mx'),
('Sor Juana Ines De La Cruz', 'Pública', 'Basico', 'Gerardo Banda Soza', 'Calle Troya#47', '4623456789', 'sorjuain@hotmail.com', 'www.sorjuanainesdelacruz.gob.mx')
GO