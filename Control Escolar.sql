-- Verificaci�n de Existencia y Creaci�n de la Base de Datos

-- USAR BASE DE DATOS MASTER
USE master
GO
-- Verificaci�n 
IF DB_ID('bdcontrolescolar') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE bdcontrolescolar
END
GO
-- Creaci�n de la Base de Datos
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

-- CREACI�N DE LAS TABLAS
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

CREATE TABLE estados(
id_estado INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre_estado NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE paises(
id_pais INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre_pais NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE grados(
id_grado INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE aulas(
id_aula INT NOT NULL PRIMARY KEY IDENTITY (1,1),
aula NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE cursos(
id_curso INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre_curso NVARCHAR(MAX) NOT NULL,
id_profe NVARCHAR(MAX) NOT NULL,	
id_aula NVARCHAR(MAX) NOT NULL,
id_grado NVARCHAR(MAX) NOT NULL,
id_materia NVARCHAR(MAX) NOT NULL,
id_taller NVARCHAR(MAX) NULL DEFAULT('NO SE ASIGNO TALLER'),
fecha_inicio NVARCHAR(MAX) NOT NULL,
fecha_fin NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE materias(
id_materia INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre NVARCHAR(MAX) NOT NULL)
GO

CREATE TABLE calificaciones(
id_calificacion INT NOT NULL PRIMARY KEY IDENTITY (1,1),
no_control INT NOT NULL,
id_materia NVARCHAR(MAX) NOT NULL,
calificacion INT NOT NULL)
GO

CREATE TABLE talleres(
id_taller INT NOT NULL PRIMARY KEY IDENTITY (1,1),
nombre NVARCHAR(MAX) NOT NULL)
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
pagina_web NVARCHAR(MAX) NULL DEFAULT('SIN P�GINA WEB'),)
GO

CREATE TABLE comentarios(
id_comentario INT NOT NULL PRIMARY KEY IDENTITY (1,1),
comentario  NVARCHAR(MAX) NOT NULL)
GO

--RELACI�N ENTRE PROFESORES Y PAISES
ALTER TABLE profesores
ADD CONSTRAINT FK_PROFESORES_PAISES
FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE PROFESORES Y ESTADOS
ALTER TABLE profesores
ADD CONSTRAINT FK_PROFESORES_ESTADOS
FOREIGN KEY (id_estado) REFERENCES estados(id_estado)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE PROFESORES Y USUARIOS
ALTER TABLE profesores
ADD CONSTRAINT FK_PROFESORES_USUARIOS
FOREIGN KEY (id_user_profe) REFERENCES usuarios(id_user_profe)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE ALUMNOS Y PAISES
ALTER TABLE alumnos
ADD CONSTRAINT FK_ALUMNOS_PAISES
FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE ALUMNOS Y ESTADOS
ALTER TABLE alumnos
ADD CONSTRAINT FK_ALUMNOS_ESTADOS
FOREIGN KEY (id_estado) REFERENCES estados(id_estado)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE ALUMNOS Y AULAS
ALTER TABLE alumnos
ADD CONSTRAINT FK_ALUMNOS_AULAS
FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE ALUMNOS Y GRADOS
ALTER TABLE alumnos
ADD CONSTRAINT FK_ALUMNOS_GRADOS
FOREIGN KEY (id_grado) REFERENCES grados(id_grado)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE ALUMNOS Y ESCUELAS
ALTER TABLE alumnos
ADD CONSTRAINT FK_ALUMNOS_ESCUELAS
FOREIGN KEY (id_escuela) REFERENCES escuelas(id_escuela)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CURSOS Y PROFESORES
ALTER TABLE cursos
ADD CONSTRAINT FK_CURSOS_PROFESORES
FOREIGN KEY (id_profe) REFERENCES profesores(id_profe)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CURSOS Y AULAS
ALTER TABLE cursos
ADD CONSTRAINT FK_CURSOS_AULAS
FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CURSOS Y GRADOS
ALTER TABLE cursos
ADD CONSTRAINT FK_CURSOS_GRADOS
FOREIGN KEY (id_grado) REFERENCES grados(id_grado)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CURSOS Y MATERIAS
ALTER TABLE cursos
ADD CONSTRAINT FK_CURSOS_MATERIAS
FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CURSOS Y TALLERES
ALTER TABLE cursos
ADD CONSTRAINT FK_CURSOS_TALLERES
FOREIGN KEY (id_taller) REFERENCES talleres(id_taller)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CALIFICACIONES Y ALUMNOS
ALTER TABLE calificaciones
ADD CONSTRAINT FK_CALIFICACIONES_ALUMNOS
FOREIGN KEY (no_control) REFERENCES alumnos(no_control)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACI�N ENTRE CALIFICACIONES Y MATERIAS
ALTER TABLE calificaciones
ADD CONSTRAINT FK_CALIFICACIONES_MATERIAS
FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--RELACION ENTRE ALUMNOS Y CURSOS
ALTER TABLE alumnos
ADD CONSTRAINT FK_ALUMNOS_CURSOS
FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
ON UPDATE NO ACTION
ON DELETE NO ACTION
GO

-- REGISTROS DE LA TABLA MATERIAS, ESTADOS Y PAISES FUERON IMPORTADOS
---------------------------------------------------------------------

-- REGISTROS DE TABLA GRADOS
INSERT INTO grados(nombre) VALUES('PRIMER GRADO 1�'),
('SEGUNDO GRADO 2�'),
('TERCER GRADO 3�'),
('CUARTO GRADO 4�'),
('QUINTO GRADO 5�'),
('SEXTO GRADO 6�'),
('SEPTIMO GRADO (1� Secundaria) 7�'),
('OCTAVO GRADO (2� Secundaria) 8�'),
('NOVENO GRADO (3� Secundaria) 9�')
GO

-- REGISTROS DE LA TABLA AULAS
INSERT INTO aulas(aula) VALUES('AULA N�MERO 1'),
('AULA N�MERO 2'),
('AULA N�MERO 3'),
('AULA N�MERO 4'),
('AULA N�MERO 5'),
('AULA N�MERO 6'),
('AULA N�MERO 7'),
('AULA N�MERO 8'),
('AULA N�MERO 9'),
('AULA N�MERO 10'),
('AULA N�MERO 11'),
('AULA N�MERO 12'),
('AULA N�MERO 13'),
('AULA N�MERO 14'),
('AULA N�MERO 15'),
('AULA N�MERO 16'),
('AULA N�MERO 17'),
('AULA N�MERO 18'),
('AULA N�MERO 19'),
('AULA N�MERO 20'),
('AULA N�MERO 21'),
('AULA N�MERO 22'),
('AULA N�MERO 23'),
('AULA N�MERO 24'),
('AULA N�MERO 25'),
('AULA N�MERO 26'),
('AULA N�MERO 27'),
('AULA N�MERO 28'),
('AULA N�MERO 29'),
('AULA N�MERO 30')
GO

-- REGISTROS DE LA TABLA TALLERES
INSERT INTO talleres(nombre) VALUES('AGRICULTURA'),
('APICULTURA'),
('IND. RURALES'),
('PECUARIAS'),
('TALLER B�SICO'),
('TALLER DE SECRETARIADO'),
('TALLER DE CORTE Y CONFECCI�N'),
('COMPUTACI�N')
GO

-- REGISTROS DE LA TABLA ESCUELAS
INSERT INTO escuelas(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web)
VALUES('Jos� Maria Morelos', 'P�blica', 'Basico', 'Hector Hern�ndez Robles', 'Colonia Pedregal Calle Los Arcos #741', '1234567890', 'jmariamorelos@hotmail.com', 'www.josemariamoles.gob.mx')
GO

INSERT INTO escuelas(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web)
VALUES('Benito Juarez', 'P�blica', 'Basico', 'Javier Camarillo Duarte', 'Estacion Joaquin', '4291139023', 'benijua@hotmail,com', 'www,benitojuarez.gob.mx'),
('Justo Sierra', 'P�blica', 'Basico', 'Luis Martinez Luna', 'Estacion Joaquin', '4291236453', 'justsie@hotmail.com', 'www,justosier.gob.mx'),
('Nicolas Bravo', 'P�blica', 'Basico', 'Sonia Ramirez Beltran', 'Calle Bola�os#45', '4299364574', 'nicobrav@hotamail.com', 'www,nicolasbrav.gob.mx'),
('Emiliano Zapata', 'P�blica', 'Basico', 'Ramon Vargas Noriega', 'Calle 20Sep#70', '4625437634', 'emilizap@hotmail.com', 'www.emilizap.gob.mx'),
('Josefa Ortiz De Dominguez', 'P�blica', 'Basico', 'Maria Leon Cervantes', 'Calle Degollado#45', '4299074567', 'joseort@hotmail.com', 'www.joseort.gob.mx'),
('Heroes De Chapultepec', 'P�blica', 'Basico', 'Jose Martinez Ceballos', 'Calle Alba#12', '4621345564', 'heroeschap@hotmail.com', 'www.heroeschapul.gob.mx'),
('Ignacio Allende', 'P�blica', 'Basico', 'Fernando Ramirez HUerta', 'Calle Mina#78', '4293456789', 'ignacioalle@hotmail.com', 'www.ignacioalle.gob.mx'),
('Juan Escutia', 'P�blica', 'Basico', 'Rosa Contreras Mendez', 'Calle Degollado#48', '4291234567', 'juanescut@hotmail.com', 'www.juanescutia.gob.mx'),
('Carmen Ramos Del Rio', 'P�blica', 'Basico', 'David Morales Juarez', 'Calle Valle#26', '4292357890', 'carmenram@hotmail.com', 'www.carmenramos.gob.mx'),
('Francisco I Madero', 'P�blica', 'Basico', 'Manuel Cervantes Rios', 'Calle Bola�os#49', '4629074567', 'francismad@hotmail.com', 'www.franciscomader.gob.mx'),
('20 de Noviembre', 'P�blica', 'Basico', 'Diana Luna Ponce', 'Calle Salazar#72', '429564237', '20nov@hotmail.com', 'www.20noviem.gob.mx'),
('18 de Marzo', 'P�blica', 'Basico', 'Raul Mendez Rojas', 'Calle Alba#19', '4292094523', '18marz@hotmail.com', 'www.1marzo.gob.mx'),
('Las Naciones Unidas', 'P�blica', 'Basico', 'Natalia Aguirre Galvan', 'Calle 20Sep#78', '4298756356', 'naciuni@hotmail.com', 'nacionunid.gob.mx'),
('Lazaro Cardenas', 'P�blica', 'Basico', 'Juan Zavala Rios', 'Calle Valle#25', '429123456', 'lazcard@hotmail.com', 'www.lazcarde.gob.mx'),
('Benisario Dominguez', 'P�blica', 'Basico', 'Dana Elizarraraz Noriega', 'Calle Guadalupe#62', '4621876530', 'benidom@hotmail.com', 'benisadomin.gob.mx'),
('Cuahutemoc', 'P�blica', 'Basico', 'Alan Rocha Gonzalez', 'Calle Guadalupe#55', '462965643', 'cuahu@hotmail.com', 'www.cuahutemoc.gob.mx'),
('Miguel Hidalgo', 'P�blica', 'Basico', 'Teresa Martinez Bravo', 'Calle Salazar#78', '4297654439', 'miguehidal@hotmail.com', 'www.miguelhidal.gob.mx'),
('Morelos I Pavon', 'P�blica', 'Basico', 'Elena Gonzalez Balandran', 'Calle Bola�os#23', '429145679', 'morelpav@hotmail.com', 'www.morelosipav.gob.mx'),
('Benustiano Carranza', 'P�blica', 'Basico', 'Susana Elizarraraz Rosales', 'Calle Matamoros#45', '42931256709', 'benustcarran@hotmail.com', 'www.benustianocarranza.gob.mx'),
('Benito Juarez', 'P�blica', 'Basico', 'Rubi Ramirez Guerra', 'Calle Roma#74', '4620985674','benitojuarez@hotmail.com', 'www.benitojuarez.gob.mx'),
('Ignacio Allende', 'P�blica', 'Basico', 'Carla rodriguez Gonzalez', 'Calle Morelos#34', '4291003608', 'ignallen@hotmail.com', 'www.ignacioallende.gob.mx'),
('Carlos Cortes', 'P�blica', 'Basico', 'Elizabeth Ramirez Hernandez', 'Calle Mina#78', '4621456709', 'carlocort@hotmsil.com', 'www.crloscortes.gob.mx'),
('Macrina', 'P�blica', 'Basico', 'Liliana Gonzalez Nu�ez', 'Calle Troya#48', '429456723', 'macrina@hotmail.com', 'www.macrina,gob.mx'),
('Miguel Hidalgo', 'P�blica', 'Basico', 'Elia Guerrero Noriega', 'Calle Italia#40', '4291023465', 'miguelhidal@hotmail.com', 'www.miguelhidalgo.gob.mx'),
('Guadalupe Victoria', 'P�blica', 'Basico', 'Fabian Alcantar Guerrero', 'Calle Matamoros#49', '4624539078', 'guadalupvic@hotmail.com', 'www.guadalupevictori.gob.mx'),
('Pancho Villa', 'P�blica', 'Basico', 'Leonor Guerra Rojas', 'Calle Italia#45', '4291236798', 'panchov@hotmail.com', 'www.panchovilla.gob.mx'),
('Sor Juana Ines De La Cruz', 'P�blica', 'Basico', 'Gerardo Banda Soza', 'Calle Troya#47', '4623456789', 'sorjuain@hotmail.com', 'www.sorjuanainesdelacruz.gob.mx')
GO

-- VISTAS DE HOJA DE DATOS DE MIS TABLAS
SELECT * FROM alumnos
SELECT * FROM aulas
SELECT * FROM calificaciones
SELECT * FROM cursos
SELECT * FROM escuelas
SELECT * FROM estados
SELECT * FROM grados
SELECT * FROM materias
SELECT * FROM paises
SELECT * FROM profesores
SELECT * FROM talleres
SELECT * FROM usuarios

-- REGISTRO DE SUPER USUARIO EN TABLA USUARIOS
-- TIPOS DE USUARIO: MAESTRO, ADMINISTRADOR Y SUPER USUARIO
INSERT INTO usuarios(nombre_usuario, contrasena, tipo) VALUES('MASTER', PWDENCRYPT('AdminRootToor'), 'SUPER USUARIO')
INSERT INTO usuarios(nombre_usuario, contrasena, tipo) VALUES('1', PWDENCRYPT('1'), 'MAESTRO')
GO

INSERT INTO estados VALUES('ESTADO1') 
GO
INSERT INTO estados VALUES('ESTADO2') 
GO

INSERT INTO paises VALUES('PAIS1') 
GO
INSERT INTO paises VALUES('PAIS2') 
GO

INSERT INTO materias VALUES('GMT1') 
GO
INSERT INTO materias VALUES('GMT2') 
GO

INSERT INTO profesores VALUES('Juan', 'Roa', 'Masculino', 'SIN DIR', 'ABASOLO', 1,1, '1234567890', '0987654321', 'ACTIVO', 2)
GO

INSERT INTO cursos VALUES('Mi Curso',1,1,1,1,1,'ESTA FECHA FEA', 'OTRA FECHA FEA')
GO
SELECT * FROM cursos;

INSERT INTO alumnos VALUES('CHANO', 'Peto', 'CON DIR', 'JUANICO', 1,1, '1234567890', '0987654321', 'asdasdadasfa', '12/12/12', 'MASCULINO',1,'e',1,1,1)
GO

INSERT INTO calificaciones VALUES(1,1,10)
GO


-- CONSULTAS EXTRA�AS

SELECT * FROM profesores INNER JOIN usuarios ON profesores.id_user_profe = usuarios.id_user_profe
GO
SELECT * FROM alumnos
SELECT * FROM calificaciones
SELECT * FROM cursos
SELECT * FROM escuelas
SELECT * FROM profesores
SELECT * FROM usuarios

SELECT no_control as [N�mero de Control], nombres as Nombres, apellidos as Apellidos, direccion as Direcci�n, ciudad as Ciudad, id_pais as Pa�s, id_estado as Estado, telefono_casa as [Tel�fono de Casa], celular as Celular, correo as [E-Mail], fecha_nacimiento as [Fecha de Nacimiento], sexo as Sexo, id_aula as Aula, grupo as Grupo, id_grado as Grado, id_curso as Curso, id_escuela as Escuela FROM alumnos
GO

SELECT id_user_profe AS [Id del Usuario del Profesor], nombre_usuario as [Nombre de Usuario], contrasena as [Contrase�a Encriptada], tipo as [Tipo de Usuario] FROM usuarios

select no_control as [N�mero de Control], id_materia as [MATERIA], calificacion as [CALIFICACI�N] from calificaciones

SELECT id_escuela as [ID de la Escuela], nombre as [Nombre], tipo as [Tipo], director as [Director], ubicacion as [Ubicaci�n], telefono as [Tel�fono], correo as Correo, pagina_web as [P�gina Web] FROM escuelas

SELECT id_profe as [ID del Profesor], nombres as [Nombres], apellidos as Apellidos, sexo as Sexo, direccion as [Direcci�n], ciudad as Ciudad, id_pais as [Pa�s], id_estado as Estado, telefono_casa as [Tel�fono de Casa], celular as Celular, estado_trabajo as [Estado de Trabajo], id_user_profe as [N�mero de Usuario Asignado] FROM profesores

SELECT id_profe as [ID del Profesor], nombres as [Nombres], apellidos as Apellidos, sexo as Sexo, estado_trabajo as [Estado de Trabajo] FROM profesores


