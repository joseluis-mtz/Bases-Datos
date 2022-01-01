-- Verificación de Existencia y Creación de la Base de Datos

-- USAR BASE DE DATOS MASTER
USE master
GO
-- Verificación 
IF DB_ID('bdshowuniverse') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE bdshowuniverse
END
GO
-- Creación de la Base de Datos
CREATE DATABASE bdshowuniverse
ON PRIMARY
(NAME = 'bdshowuniverse.MDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdshowuniverse.MDF',
SIZE = 40MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 20%),

(NAME = 'bdshowuniverse.NDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdshowuniverse.NDF',
SIZE = 20MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%)

LOG ON
(NAME = 'bdshowuniverse.LDF',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdshowuniverse.LDF',
SIZE = 15MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5%)
GO

-- Eliminar la Base de Datos
DROP DATABASE bdshowuniverse
GO
-- Uso de la base de datos para crear tablas
USE bdshowuniverse

-- Cambio del nombre de la base de DATOS
ALTER DATABASE bdshowuniverse 
Modify name = universo
GO

-- Uso nuevamente de la base de datos
use universo

-- Creación de las TABLAS
use bdshowuniverse
-- Crear la tabla PLANETAS
CREATE TABLE planetas(
id_planeta smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(30) NOT NULL unique,
diametro_ecuatorial real NOT NULL,
masa real NOT NULL,
periodo_orbital_anos real NOT NULL,
periodo_de_rotacion_dias real NOT NULL,
imagen image NULL,
id_satelite smallint  NULL,
id_constelacion smallint  NULL
 )

-- Crear la tabla SATELITES
CREATE TABLE satelites(
id_satelite smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(30) NOT NULL,
diametro int NOT NULL,
periodo_orbital varchar(40) NOT NULL,
ubicacion varchar(80) NOT NULL,
tamano char(9) NOT NULL,
tipo_satelite varchar(20) NOT NULL,
imagen image NULL)

-- Crear la tabla VIAJES
CREATE TABLE viajes(
id_viaje smallint NOT NULL PRIMARY KEY identity(1,1),
lugar_salida varchar(40) NOT NULL,
destino varchar(60) NOT NULL,
duracion varchar(20) NULL,
proposito varchar(MAX) NOT NULL,
numero_integrantes smallint NOT NULL,
encargado varchar(60) NOT NULL,
foto_encargado image NULL,
nombre_viaje varchar(30) NOT NULL,
tipo varchar(20) NOT NULL,
id_astronauta smallint  NULL,
id_transporte smallint  NULL,
id_planeta smallint  NULL,
id_satelite smallint  NULL,
id_constelacion smallint  NULL,
id_observatorio smallint  NULL
)

-- Crear la tabla ASTRONAUTAS
CREATE TABLE astronautas(
id_astronauta smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(40) NOT NULL,
edad tinyint NOT NULL,
fecha_nacimiento date NOT NULL,
estatura real NULL,
correo varchar(30) NOT NULL,
telefono char(10) NOT NULL,
foto image NULL)

-- Crear la tabla MEDIOS DE TRANSPORTE
CREATE TABLE medios_transporte(
id_transporte smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(40) NOT NULL,
tamano char(10) NOT NULL,
capacidad_personas tinyint NOT NULL,
tipo varchar(40) NOT NULL,
dueno varchar(70) NOT NULL,
velocidad_max real NULL,
imagen image NULL,
id_astronauta smallint  NULL)

-- Crear la tabla PREGUNTAS
CREATE TABLE preguntas(
id_pregunta smallint NOT NULL PRIMARY KEY identity(1,1),
tema varchar(60) NOT NULL,
longitud int NULL,
tipo varchar(35) NOT NULL,
pregunta varchar(690) NOT NULL unique,
grado_dificultad varchar(35) NOT NULL,
id_respuesta smallint  NULL,
id_planeta smallint  NULL,
id_satelite smallint  NULL,
id_viaje smallint  NULL,
id_constelacion smallint  NULL,
id_observatorio smallint  NULL,
id_astronauta smallint  NULL,
id_transporte smallint  NULL)

-- Crear la tabla RESPUESTAS
CREATE TABLE respuestas(
id_respuesta smallint NOT NULL PRIMARY KEY identity(1,1),
tipo varchar(60) NOT NULL,
longitud int NULL,
respuesta varchar(690) NOT NULL unique,
id_usuario smallint  NULL)

-- Crear la tabla CONSTELACIONES
CREATE TABLE constelaciones(
id_constelacion smallint NOT NULL PRIMARY KEY identity(1,1),
nombre_en_latin varchar(55) NOT NULL,
nombre_en_espanol varchar(55) NOT NULL,
elemento varchar(50) NOT NULL,
simbolo image NULL,
duracion_tropical varchar(50) NOT NULL,
domicilio varchar(70) NOT NULL,
imagen image NULL)

-- Crear la tabla EVALUACIONES
CREATE TABLE evaluaciones(
id_evaluacion smallint NOT NULL PRIMARY KEY identity(1,1),
tema varchar(50) NOT NULL,
puntuacion tinyint NOT NULL,
fecha_duracion smalldatetime NOT NULL,
id_usuario smallint  NULL,
id_pregunta smallint  NULL,
id_respuesta smallint  NULL)

-- Crear la tabla OBSERVATORIOS
CREATE TABLE observatorios(
id_observatorio smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(90) NOT NULL,
direccion varchar(490) NOT NULL,
dueno varchar(90) NOT NULL,
pais varchar(60) NOT NULL,
tamano varchar(15) NOT NULL,
fecha_creacion date NOT NULL,
imagen image NULL,
id_constelacion smallint  NULL,
id_planeta smallint  NULL,
id_satelite smallint  NULL)

-- Crear la tabla 
CREATE TABLE usuarios(
id_usuario smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(40) NOT NULL,
apellido_p varchar(40) NOT NULL,
apellido_m varchar(40) NULL,
fecha_nacimiento date NOT NULL,
edad tinyint NOT NULL,
telefono_celular varchar(15) NULL,
telefono_casa varchar(15) NULL,
sexo varchar(25) NOT NULL,
correo varchar(55) NOT NULL unique,
domicilio varchar(450) NOT NULL,
codigo_postal char(9) NOT NULL,
estado varchar(55) NOT NULL,
ciudad varchar(55) NOT NULL,
nombre_usuario varchar(50) NOT NULL unique,
pass varchar(50) NOT NULL unique)

-- Crear la tabla
CREATE TABLE escuelas(
id_escuela smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(60) NOT NULL,
tipo varchar(50) NOT NULL,
nivel_escolar varchar(55) NOT NULL,
director varchar(70) NOT NULL,
ubicacion varchar(480) NOT NULL,
telefono varchar(15) NOT NULL,
correo varchar(60) NOT NULL unique,
pagina_web varchar(60) NULL unique,
id_usuario smallint  NULL)
GO
-- Eliminar tablas de una base de datos
DROP TABLE escuelas
GO
-- Cambiar nombre de la tabla
EXEC sp_rename 'usuarios', 'alumnos'
GO
-- AGREGAR CAMPO A LA TABLA
ALTER TABLE alumnos
ADD estatura real null
GO
-- BORRAR CAMPO DE TABLA
ALTER TABLE alumnos
DROP Column estatura
GO
-- CAMBIAR NOMBRE DE ATRIBUTO
EXEC sp_rename 'alumnos.domicilio', 'direccion', 'column';
GO

-- CREACIÓN DE LAS RELACIONES
--RELACIÓN ENTRE PLANETAS y SATELITES 
ALTER TABLE planetas
ADD CONSTRAINT FK_PLANETAS_SATELITES
FOREIGN KEY (id_satelite) REFERENCES satelites(id_satelite)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PLANETAS Y CONSTELACIONES
ALTER TABLE planetas
ADD CONSTRAINT FK_PLANETAS_CONSTELACIONES
FOREIGN KEY (id_constelacion) REFERENCES constelaciones(id_constelacion)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE VIAJES Y ASTRONAUTAS
ALTER TABLE viajes
ADD CONSTRAINT FK_VIAJES_ASTRONAUTAS
FOREIGN KEY (id_astronauta) REFERENCES astronautas(id_astronauta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE VIAJES Y MEDIOS DE TRANSPORTE
ALTER TABLE viajes
ADD CONSTRAINT FK_VIAJES_MEDIOS_DE_TRANSPORTE
FOREIGN KEY (id_transporte) REFERENCES medios_transporte(id_transporte)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE VIAJES Y PLANETAS
ALTER TABLE viajes
ADD CONSTRAINT FK_VIAJES_PLANETAS
FOREIGN KEY (id_planeta) REFERENCES planetas(id_planeta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE VIAJES Y SATELITES
ALTER TABLE viajes
ADD CONSTRAINT FK_VIAJES_SATELITES
FOREIGN KEY (id_satelite) REFERENCES satelites(id_satelite)
ON UPDATE NO ACTION
ON DELETE NO ACTION

--RELACIÓN ENTRE VIAJES Y CONSTELACIONES
ALTER TABLE viajes
ADD CONSTRAINT FK_VIAJES_CONSTELACIONES
FOREIGN KEY (id_constelacion) REFERENCES constelaciones(id_constelacion)
ON UPDATE NO ACTION
ON DELETE NO ACTION

--RELACIÓN ENTRE VIAJES Y OBSERVATORIOS
ALTER TABLE viajes
ADD CONSTRAINT FK_VIAJES_OBSERVATORIOS
FOREIGN KEY (id_observatorio) REFERENCES observatorios(id_observatorio)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE MEDIOS DE TRANSPORTE Y ASTRONAUTAS
ALTER TABLE medios_transporte
ADD CONSTRAINT FK_MEDIOS_DE_TRANSPORTE_ASTRONAUTAS
FOREIGN KEY (id_astronauta) REFERENCES astronautas(id_astronauta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y RESPUESTAS
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_RESPUESTAS
FOREIGN KEY (id_respuesta) REFERENCES respuestas(id_respuesta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y PLANETAS
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_PLANETAS
FOREIGN KEY (id_planeta) REFERENCES planetas(id_planeta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y SATELITES
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_SATELITES
FOREIGN KEY (id_satelite) REFERENCES satelites(id_satelite)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y VIAJES
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_VIAJES
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y CONSTELACIONES
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_CONSTELACIONES
FOREIGN KEY (id_constelacion) REFERENCES constelaciones(id_constelacion)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y OBSERVATORIOS
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_OBSERVATORIOS
FOREIGN KEY (id_observatorio) REFERENCES observatorios(id_observatorio)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y ASTRONAUTAS
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_ASTRONAUTAS
FOREIGN KEY (id_astronauta) REFERENCES astronautas(id_astronauta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE PREGUNTAS Y MEDIOS DE TRANSPORTE
ALTER TABLE preguntas
ADD CONSTRAINT FK_PREGUNTAS_MEDIOS_DE_TRANSPORTE
FOREIGN KEY (id_transporte) REFERENCES medios_transporte(id_transporte)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE RESPUESTAS Y USUARIOS
ALTER TABLE respuestas
ADD CONSTRAINT FK_RESPUESTAS_USUARIOS
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE EVALUACIONES Y USUARIOS
ALTER TABLE evaluaciones
ADD CONSTRAINT FK_EVALUACIONES_USUARIOS
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE EVALUACIONES Y PREGUNTAS
ALTER TABLE evaluaciones
ADD CONSTRAINT FK_EVALUACIONES_PREGUNTAS
FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE EVALUACIONES Y RESPUESTAS
ALTER TABLE evaluaciones
ADD CONSTRAINT FK_EVALUACIONES_RESPUESTAS
FOREIGN KEY (id_respuesta) REFERENCES respuestas(id_respuesta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE OBSERVATORIOS Y CONSTELACIONES
ALTER TABLE observatorios
ADD CONSTRAINT FK_OBSERVATORIOS_CONSTELACIONES
FOREIGN KEY (id_constelacion) REFERENCES constelaciones(id_constelacion)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE OBSERVATORIOS Y PLANETAS
ALTER TABLE observatorios
ADD CONSTRAINT FK_OBSERVATORIOS_PLANETAS
FOREIGN KEY (id_planeta) REFERENCES planetas(id_planeta)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE OBSERVATORIOS Y SATELITES
ALTER TABLE observatorios
ADD CONSTRAINT FK_OBSERVATORIOS_SATELITES
FOREIGN KEY (id_satelite) REFERENCES satelites(id_satelite)
ON UPDATE cascade
ON DELETE cascade

--RELACIÓN ENTRE ESCUELAS Y USUARIOS
ALTER TABLE escuelas
ADD CONSTRAINT FK_ESCUELAS_USUARIOS
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
ON UPDATE cascade
ON DELETE cascade
GO

-- INSERTAR REGISTROS DE LAS TABLAS

-- REGISTROS DE LA TABLA SATELITES:
INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Luna', 3476, '27d 7h 43.7m', 'Tierra', 'Mediano', 'Natural')
GO

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Io', 3643, '1d 18h 27.6m', 'Jupiter', 'mediano', 'natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Europa', 3122, '3.551181d', 'Jupiter', 'Mediano', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Ganimedes', 5262, '7d 3h 42.6m', 'Jupiter', 'Grande', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Calisto', 4821, '16.6890184d', 'Jupiter', 'Grande', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Titan', 5162, '15d 22h 41m', 'Saturno', 'Grande', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Tetis', 1062, '1.888d', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Dione', 1118, '2.736915d', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Rea', 1529, '4.518d', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Japeto', 1436, '79d 19h 17m', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Mimas', 416, '22h 37m', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Encelado', 499, '32h 53m', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Miranda', 472, '1.413d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Ariel', 1162, '2.520d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Umbriel', 1172, '4.144d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Titania', 1577, '8.706d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Oberon', 1523, '13.46d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Triton', 2707, '-5.877d', 'Neptuno', 'Mediano', 'Natural')

INSERT INTO satelites(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Caronte', 1207, '6.387230d', 'Pluton', 'Pequeno', 'Natural')
GO

-- REGISTROS DE LA TABLA CONSTELACIONES:
INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Aries', 'Aries el carnero', 'Fuego', 'Marzo21-Abril20', 'Marte')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Taurus', 'Tauro el toro', 'Tierra', 'Abril21-Mayo21', 'Marte')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Gemini', 'Geminis los gemelos', 'Aire', 'Mayo22-Junio21', 'Mercurio')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Cancer', 'Cancer el cangrejo', 'Agua', 'Junio22-Julio22', 'Luna')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Leo', 'Leo el leon', 'Fuego', 'Julio22-Agosto23', 'Sol')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Virgo', 'Virgo la virgen', 'Tierra', 'Agosto23-Septiembre22', 'Mercurio')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Libra', 'Libra la balanza', 'Aire', 'Septiembre23-Octubre23', 'Venus')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Escorpio', 'Escorpio el escorpion', 'Agua', '0ctubre23-Noviembre21', 'Pluton y Marte')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Sagittarius', 'Sagitario el arqueo', 'Fuego', 'Noviembre22-Diciembre21', 'Jupiter')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Capricornus', 'Capricornio la cabra de mar', 'Tierra', 'Diciembre22-Enero20', 'Saturno')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Aquarius', 'Acuario el aguador o portador de agua', 'Aire', 'Enero21-Febrero19', 'Saturno o Urano')

INSERT INTO constelaciones(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Piscis', 'Piscis los peces', 'Agua', 'Febrero20-Marzo20', 'Neptuno o Jupiter')
GO

-- REGISTROS DE LA TABLA PLANETAS:
INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Mercurio', 0.3854587, 0.06, 0.38, 0.241, 1, 1)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Venus', 0.949, 0.82, 0.72, 0.615, 2, 2)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Tierra', 1.00, 1.00, 1.00, 1.00, 3, 3)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Marte', 0.53, 0.11, 1.52, 1.88, 4, 4)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Jupiter', 11.2, 318, 5.20, 11.86, 5, 5)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Saturno', 9.41, 95, 9.55, 29.46, 6, 6)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Urano', 3.98, 14.6, 19.22, 84.01, 7, 7)

INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Neptuno', 3.81, 17.2, 30.06, 164.79, 8, 8)
-- VARIOS REGISTROS
INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Ceres',  952.4, 0.00016, 4.599, 0.3781, 9, 9)
INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Pluton', 2302, 0.82, 247.92, -6.3872, 10,10)
INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Haumea', 0.09, 0.0007, 285.4, 0.167 ,11,11)
INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Makemake', 0.12, 0.0007, 309.9, 0.168, 12, 12)
INSERT INTO planetas(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Eris', 2398, 0.0028, 557,0.169, 13, 12)
GO

-- REGISTROS DE LA TABLA ASTRONAUTAS (1 registro)
INSERT INTO astronautas(nombre, edad, fecha_nacimiento, estatura, correo, telefono)
VALUES('Juan Luis', 40, '1979-02-19', 1.80, 'Juanitogalan@hotmail.com', '4298761234')
GO

-- VARIOS REGISTROS
INSERT INTO astronautas(nombre, edad, fecha_nacimiento, estatura, correo, telefono)
VALUES('Guadalupe Ramíres', 34, '1977-04-23', 1.79, 'Lupe736_w@hotmail.com', '4291827272'),
('Alan Castillo', 46, '1971-06-14', 1.68, 'Alan_Ortuga@outlook.com', '4628329392'),
('Luis Antonio Delgado', 32, '1980-04-23', 1.82, 'Luisan_34@hotmail.com','4291004623'),
('Yahir Ortega ledesma', 38, '', 1.78, 'Yahirito_45d@hotmail.com', '4283990193'),
('Luis Angel Arellano', 45, '', 1.76, 'Angelito_23@outlook.com', '4291847383'),
('Marco Antonio Rios', 39, '', 1.80, 'MArco_93ks@hotmail.com', '4628119303'),
('David Velazquez', 46, '', 1.78, 'Daviddj32@outlook.com', '4291002934'),
('Fernando Vaszquez', 50, '', 1.82, 'Fer_2932@hotmail.com', '4293829173'),
('Mauricio Uribe', 46, '', 1.80, 'Maulizo@hotmail.com', '7326373328'),
('Rogelio Hurtado', 54, '', 1.78, 'Roge_273@hotmail.com', '4201291283'),
('Joel Castro', 43, '', 1.80, 'JoelCastillo_23s@hotmail.com','4292837432'),
('José Fernando Gallo', 39, '', 1.82,'JosFer_342@hotmail.com', '4362718239'),
('Diego Ponce', 62, '', 1.82, 'Diegomsu_23@outlook.com', '4291004987'),
('Jorge Hernandes', 54, '', 1.80, 'Jorgedmil_32@hotmail.com', '4362718832'),
('Manuel Lopez Parra', 51, '', 1.78, 'Manuel_23d@gmail.com', '4292938273'),
('William Shakespeare', 50, '', 1.82, 'wili_472@hotmail.com', '4293817328'),
('Oscar Arrollo', 43, '', 1.80, 'Oscararoojo_ew@hotmail.com', '4291837323'),
('Barbara Corman', 33, '', 1.75, 'Barbaracor_56@outlook.com', '4839990329'),
('Jorge Alejandro Martines', 39, '', 1.79, 'jorgeAle_32@hotmail.com', '4298272356'),
('Luis Enrique Garmendia', 43,'', 1.80,'Luisingermen23@hotmail.com', '4392304528'),
('Javier Vaca', 43, '', 1.78, 'JaviVaca_32@outlook.com', '4283920837'),
('Abdullah Jones', 42, '', 1.85, 'Abdulaahjon_32@hotmail.com', '4291938648'),
('Devyn Wilson', 46, '', 1.82, 'Awilson_23ed@outlook.com', '4527839047'),
('Kevin Levin', 33, '', 1.76, 'Kevinlevin234@hotmail.com', '4291004385'),
('Dillan Lewis', 37, '', 1.89, 'dillaneir_34@gmail.com', '4356789254'),
('Joey Harris', 54, '', 1.80, 'joeyharri_43@gmail.com', '4291873628'),
('Phoenix Scott', 39, '', 1.76, 'phonix445@hotmail.com', '8392736728'),
('Peyton Hill', 45, '', 1.80, 'peyton34_w23@hotmail.com', '4291092833'),
('Alonso Baker', 43, '', 1.76, 'alonso-453@outlook.com', '3928837485'),
('Edward Nelson', 33, '', 1.84, 'edwarf-443@gmail.com', '4291077957')
GO

-- REGISTROS DE LA TABLA MEDIOS_TRANSPORTE (1 registro)
INSERT INTO medios_transporte(nombre, tamano, capacidad_personas, tipo, dueno, velocidad_max, id_astronauta)
VALUES('Raptor', 'Grande', 9, 'Transbordador', 'LA NASA', 153.43, 1)
GO

-- VARIOS REGISTROS
INSERT INTO medios_transporte(nombre, tamano, capacidad_personas, tipo, dueno, velocidad_max, id_astronauta)
VALUES('thuner242', 'Mediano', 5, 'Trasbordador', 'La NASA', 148.34, 2),
('Travel56', 'Grande', 9, 'Trasbordador', 'La NASA', 173.38, 3),
('Fish4', 'Chico', 3, 'Trasbordador', 'La NASA',320.54, 4),
('skull23', 'Grande', 10, 'Trasbordador', 'La NASA', 534.43, 5),
('Travel',  'Grande', 11, 'Trasbordador', 'La NASA', 143.45, 6),
('Super-Pumpe', 'Chico', 4, 'Trasbordador', 'La NASA', 232.34, 7),
('Hero2', 'Grande', 14, 'Trasbordador', 'La NASA', 434.34, 8),
('MAnOZ8', 'Mediano', 5, 'Trasbordador', 'La NASA', 186.45, 9),
('Candy', 'Grande', 6, 'Trasbordador', 'La NASA', 124.34, 10),
('thuner4.5', 'Chico', 4, 'Trasbordador', 'La NASA', 183.23, 11),
('Asteroid','Chico', 4, 'Trasbordador', 'La NASA', 123.53, 12),
('Event Horizon', 'Grande', 11, 'Trasbordador', 'La NASA', 422.4, 13),
('Serenity', 'Mediano', 7, 'Trasbordador', 'La NASA', 234.53, 14),
('Travel453', 'Mediano', 9, 'Trasbordador', 'La NASA', 134.43, 15),
('Joss Whedon', 'Chico',2, 'Trasbordador', 'La NASA', 148.34, 16),
('Enterprise', 'Mediano', 7, 'Trasbordador', 'La NASA', 372.23, 17),
('Star treck', 'Grande', 14, 'Trasbordador', 'La NASA', 826.43, 18),
('thuner43.4', 'Chico', 3, 'Trasbordador', 'La NASA', 638.54, 19),
('Battlestar Galactica', 'Grande', 19, 'Trasbordador', 'La NASA', 892.24, 20),
('Close Encounters of the Third Kind', 'Mediano', 8, 'Trasbordador', 'La NASA', 732.28, 21),
('Nostromo ', 'Chico', 3, 'Trasbordador', 'La NASA', 183.43, 22),
('Travel483.4', 'Mediano', 7, 'Trasbordador', 'La NASA', 173.43, 23),
(' Alien', 'Chico', 3, 'Trasbordador', 'La NASA', 382.43, 24),
('Carl Macek', 'Chico', 4, 'Trasbordador', 'La NASA', 828.43, 24),
('El Halcón Milenario', 'Grande', 20, 'Trasbordador', 'La NASA', 367.37, 25),
('Han', 'Chico', 3, 'Trasbordador', 'La NASA', 382.37, 26),
('thuneru8G', 'Chico', 3, 'Trasbordador', 'La NASA', 281.48, 27),
('Viaje a la Luna', 'Chico', 4, 'Trasbordador', 'La NASA', 873.32, 28),
('BestDay', 'Chico', 2, 'Trasbordador', 'La NASA', 102.34, 29),
('Discovery 1', 'Chico', 4, 'Trasbordador', 'La NASA', 192.38, 30)
GO

-- REGISTROS DE LA TABLA OBSERVATORIOS (1 registro)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Allegheny', 'Montañas de Allegheny, Pittsburgh, Estados Unidos', 'Universidad de Pittsburgh', 'Estados Unidos', 'Mediano', '1859-11-18', 1, 1, 1)

-- VARIOS REGISTROS
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Gemini', 'Mauna Kea, Estados Unidos', 'Consorcio Gemini y AURA', 'Estados Unidos', 'Pequeño', '1983-10-23', 2, 2, 2)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Naval de los Estados Unidos', 'Washington DC, Estados Unidos', 'James Melville Gilliss', 'Estados Unidos', 'Mediano', '1830-08-11', 3, 3, 3)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Cincinnati', 'Cincinnati, Ohio, EE.UU, Cima del Mount Lookout', 'Edwin Hubble', 'Estados Unidos', 'Mediano', '1935-08-30', 4, 4, 4)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Detroit', 'Ann Arbor, Michigan, Estados Unidos', 'Universidad de Michigan', 'Estados Unidos', 'Pequeño', '1854-04-15', 5, 5, 5)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Farpoint', '34km al Suroeste de Topeka, Kansas, Estados Unidos', 'Universidad de Kansas', 'Estados Unidos', 'Mediano', '1994-01-01', 6, 6, 6)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astronomico Nacional San Pedro Martir', 'Sierra Homonima, Baja California, Mexico', 'UNAM', 'Mexico', 'Pequeño', '1971-12-10', 7, 7, 7)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astrofisico Nacional de Tonantzintla', 'Cerro de Tonantzintla, Municipio San Andres Cholula, Puebla, Mexico', 'Luis Enrique Erro', 'Mexico', 'Pequeño', '1942-02-19', 8, 8, 8)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Arecibo', 'PR-625, Arecibo, 00612,Puerto Rico', 'Universidad Cornell', 'Puerto Rico', 'Grande', '1963-03-30', 9, 9, 9)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Echo Valley', 'Parque Provincial Algonquin, Huntsville, Canada', 'Delta Grandview Resort', 'Canada', 'Mediano', '1982-10-12', 10, 10, 10)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio William Brydone Jack', 'Fredericton, Nuevo Brunswick, Canada', 'Universidad de Nuevo Brunswick', 'Canada', 'Pequeño', '1851-05-04', 11, 11, 11)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Berlin', 'Berlin, Alemania', 'Leibniz-Gemeinschaft', 'Alemania', 'Grande', '1835-12-11', 12, 12, 12)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Archenhold', 'Berlin, Alemania', 'Friedrich Simon Archenhold', 'Alemania', 'Grande', '1896-05-01', 12, 13, 13)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Hamburgo-Bergedorf', 'Distrito de Bergedorf, Hamburgo, Alemania', 'Universidad de Hamburgo', 'Alemania', 'Mediano', '1825-09-20', 1, 13, 14)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio  Cerro de Tololo', 'Valle de Elqui, Ciudad La Serena, Coquimbo, Chile', 'AURA', 'Chile', 'Mediano', '1962-11-07', 1, 1, 15)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio del Monte Stromlo', 'Cotter Rd, Weston Creek ACT 2611, Australia', 'Universidad Nacional de Australia', 'Australia', 'Mediano', '1921-01-18', 12, 1, 16)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Siding Spring', 'Observatory Rd, Coonabarabran NSW 2357, Australia', 'Universidad Nacional de Australia', 'Australia', 'Mediano', '1962-06-29', 12, 1, 17)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Calar Alto', 'Calar Alto, Almeria, España', 'Instituto de Astrofisica de Andalucia', 'España', 'Mediano', '1973-07-14', 1, 1, 18)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Real Observatorio de Madrid', 'Calle de Alfonso Xll, 3, 28014', 'Instituto Geografico Nacional', 'España', 'Mediano', '1667-08-15', 12, 11, 19)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Real Observatorio de Greenwich', 'Blackheath Ave, London SE10 8XJ, Reino Unido', 'Rey Carlos ll de Inglaterra', 'Reino Unido', 'Mediano', '1675-08-11', 12, 5, 1)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Hadano', '1430-16 Nishitawara, Hadano, Kanagawa-Ken, 257-0027 Japan', 'Atsuo Asami', 'Japon', 'Mediano', '1995-09-01', 1, 4, 19)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astrofisico de Crimea', 'Republica de Crimea, Rusia', 'Republica Autonoma de Crimea', 'Rusia', 'Mediano', '1947-06-25', 11, 3, 1)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astrodomi', 'Talar, partido de Tigre, Provincia de Buenos Aires, Argentina', 'IAU', 'Argentina', 'Pequeño', '2008-02-10', 10, 2, 12)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Cordoba', 'Provincia de Cordoba, Argentina', 'Universidad Nacional de Cordoba', 'Argentina', 'Mediano', '1871-10-24', 9, 1, 12)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio la Silla', 'Region de Coquimbo, Chile', 'Organizacion Nacional para la Normalizacion', 'Chile', 'Grande', '1987-10-06', 12, 6, 11)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Viena', 'Ciudad de Viena, Austria', 'Universidad de Viena', 'Austria', 'Mediano', '1753-03-20', 1, 7, 1)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Kuffner', 'Viena, Austria', 'Universidad Popular Ottakring', 'Austria', 'Mediano', '1884-07-17', 1, 8, 12)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Quito', 'Av Gran Colombia y 10 de Agosto, dentro del Parque de la Alameda, Quito 170136, Ecuador', 'Escuela Politecnica Nacional', 'Ecuador', 'Mediano', '1873-08-24', 12, 9, 1)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Paris', '61 Avenue de Observatoire, 75014 Paris, Francia', 'Academia de las Ciencias', 'Francia', 'Mediano', '1667-06-21', 11, 1, 11)
INSERT INTO observatorios(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Nacional de Atenas', 'Lofos Nymfon, Thiseio, Athens 11810, Grecia', 'Baron Georgios Sinas', 'Grecia', 'Pequeño', '1842-01-30', 1, 2, 12)
GO

-- 12 constelaciones y 13 planetas y satelites 19
-- REGISTROS DE LA TABLA VIAJES (1 registro)
INSERT INTO viajes(lugar_salida, destino, duracion, proposito, numero_integrantes, encargado, nombre_viaje, tipo, id_astronauta, id_transporte, id_planeta, id_satelite, id_constelacion, id_observatorio)
VALUES('Canada', 'Venus', '8 días', 'Explorar el terreno', 12, 'Emiliano Zuria Zarate', 'ExploVenus', 'Espacial', 1, 1, 1, 1, 1, 1)
GO

-- VARIOS REGISTROS
INSERT INTO viajes(lugar_salida, destino, duracion, proposito, numero_integrantes, encargado, nombre_viaje, tipo, id_astronauta, id_transporte, id_planeta, id_satelite, id_constelacion, id_observatorio)
VALUES('Estados Unidos', 'Marte', '2 semanas', 'Observar el H2O', 5, 'Josue william', 'exposolar', 'Espacial', 2, 2, 2, 2, 2, 2),

('Canada', 'Saturno', '3 Días', 'observar piedras', 4, 'Achille ', 'Navigatorio', 'Espacial', 3, 3, 3, 3, 3, 3),

('Estados Unidos', 'Jupiter', '1 año', 'observar el planeta', 7, 'Alexandre ', 'Explorer47.3', 'Espacial', 4, 4, 4, 4, 4, 4),

('Estados Unidos', 'Saturno', '2 años', 'observar el planeta', 10, 'Apollow ', 'Explorador3.3', 'Espacial', 5, 5, 5, 5, 5, 5),

('Canada', 'Luna', '1 mes', 'Observar piedras', 7, 'August ', 'Strongexp', 'Espacial', 6, 6, 6, 6, 6, 6),
('Estados Unidos', 'Jupiter', '2 meses', 'Observar', 8, 'Ariel ', 'Raptor3G', 'Espacial', 7, 7, 7, 7, 7, 7),
('Estados Unidos', 'Venus', '3 semanas', 'Extraer piedras', 18, 'Antony ', 'Flash78A', 'Espacial', 8, 8, 8, 8, 8, 8),
('Canada', 'Luna', '1 mes 4 días', 'Observar su forma', 20, 'Andrew ', 'strongflash27', 'Espacial', 9, 9, 9, 9, 9, 9),
('Estados Unidos', 'Urano', '20 años', 'Estudiar el planeta', 14, 'Andy ', 'Dragon73.3', 'Espacial', 10, 10, 10, 10, 10, 10),
('Canada', 'Neptuno', '26 años', 'Estudiar su composición', 23, 'William ', 'SuperNep4', 'Espacial', 11, 11, 11, 11, 11, 11),

('Estados Unidos', 'Jupiter', '2 años', 'Observar e investigar', 12, 'Michael Tromp', 'FALTA NOMBRE', 'Espacial', 12, 12, 12, 12, 12, 12),

('Canada', 'Marte', '7 semanas', 'estudiar su composición', 6, 'Justin ', 'Nova2.1', 'Espacial', 13, 13, 12, 13, 1, 13),
('Estados Unidos', 'Luna', '2 meses', 'Investigar', 5, 'Alec ', 'Space27', 'Espacial', 14, 14, 1, 14, 2, 14),
('Canada', 'Saturno', '1 decada', 'investigar su estructura', 8, 'Andre ', 'countri12.3', 'Espacial', 15, 15, 2, 15, 3, 15), 

('Estados Unidos', 'Neptuno', '2 decadas', 'Estudiar elementos', 25, 'Allan ' ,'Raptor5G.2', 'Espacial', 16, 16, 3, 16, 4, 16),

('Canada', 'luna', '6 meses', 'observar la Estructura del satelite', 8, 'Noah ', 'bignavegador', 'Espacial', 17, 17, 4, 17, 5, 17),

('Estados Unidos', 'Fobos', '6 meses', 'observar su estructura', 7, 'James Delgado', 'Explorer2.3', 'Espacial', 18, 18, 5, 18, 6, 18),
('Suecia', 'Fobos', '7 meses', 'Estudiar su Composición', 8, 'Joseph Levie', 'Zerstörer3', 'Espacial', 19, 19, 6, 19, 7, 19),
('Estados Unidos', 'Venus', '8 meses', 'Investigar sus elementos', 9, 'Jackson Smilt', 'splendor34', 'Espacial', 20, 20, 7, 1, 8, 20),
('Estados Unidos', 'Jupiter', '8 meses', 'Estudiar el planeta', 11, 'James Urtado', 'DV43', 'Espacial', 21, 21, 8, 2, 1, 21),
('Canada', 'Luna', '5 meses', 'Investigar su lado oscuro', 21, 'Calvin Devin', 'RaptorUE', 'Espacial', 22, 22, 9, 3, 2, 22),

('Estados Unidos', 'Marte', '9 semanas', 'Identificar sus elementos', 12, 'Luis sprinfield', 'Dervie3', 'Espacial', 23, 23, 10, 4, 9, 23),
('Estados Unidos', 'Fobos', '3 meses', 'Observar sus rocas', 15, 'William Shut', 'Explorator32', 'Espacial', 24, 24, 11, 5, 1, 24 ),
('Estados Unidos', 'Jupiter', '1 mes 4 días', 'Observar sus rocas', 3, 'Alan Yahir Delgado', 'trueno3', 'Espacial', 25, 25, 12, 6, 2, 25),
('Estados Unidos', 'Venus', '8 meses','Estudiar el planeta', 8, 'Jacson Castro', 'EXplorador4.6', 'Espacial', 26, 26, 13, 7, 3, 26),
('Estados Unidos', 'Saturno', '9 semanas', 'Estudiar el planeta', 5, 'Danielle Levie', 'USA5V', 'Espacial', 27, 27, 1, 8, 4, 27),

('Estados Unidos', 'Venus', '1 mes 4 días', 'observar su estructura', 13, 'Ryan Clarck', 'Crack43', 'Espacial', 28, 28, 2, 9, 5, 28),
('Estados Unidos', 'Luna', '8 meses', 'Estudiar el planeta', 15, 'Isaac Hall', 'Oservatorio23', 'Espacial', 29, 29, 3, 9, 6, 29),
('Estados Unidos', 'Urano', '7 meses', 'Estudiar el planeta', 16, 'Caleb Allen', 'ViajeronUSA34', 'Espacial', 30, 30, 4, 1, 7, 30),
('Estados Unidos', 'Jupiter', '9 semanas', 'observar su estructura', 12, 'Dylan Lee', 'StrongThumer', 'Espacial', 31, 31, 5, 3, 8, 30)
GO

-- REGISTROS DE LA TABLA USUARIOS (1 registro)
INSERT INTO usuarios(nombre, apellido_p, apellido_m, fecha_nacimiento, edad, telefono_celular, telefono_casa, sexo, correo, domicilio, codigo_postal, estado, ciudad, nombre_usuario, pass)
VALUES('Paula', 'Rocha', 'Bravo', '1998-09-13', 17, '4621264251', '', 'Femenino', 'paulaedithrochabravo@hotmail.com', 'Andrés Balvaner# 4  Col. Centro', '12345', 'Guanajuato', 'Abasolo', 'paulab', '45pau')

-- VARIOS REGISTROS
INSERT INTO usuarios(nombre, apellido_p, apellido_m, fecha_nacimiento, edad, telefono_celular, telefono_casa, sexo, correo, domicilio, codigo_postal, estado, ciudad, nombre_usuario, pass)
VALUES('Jorge', 'Rodriguez', 'Martinez', '1997-10-11', 18, '4291132132', '4291134567', 'Masculino', 'jorgerodrimtz@hotmail.com', 'Pasteur Nte. # 25 Col. Centro', '17135', 'Guanajuato', 'Irapuato', 'martinezjorge', 'jorge123'),
('Juan', 'Lopez', 'Uribe', '1999-12-11', 16, '4291145569', '4625466756', 'Msculino', 'juribe@idiomas.udea.edu.com', 'Andrés Balvaner# 5  Col. Centro', '13425', 'Guanajuato', 'Abasolo', 'juanurib', 'uribe456'),
('Carla', 'Rodriguez', 'Gonzalez', '1999-07-07', 16, '4291003608', '42954634221', 'Femenino', 'carlyrod@hotmail.com', '5 de Mayo # 109 Col. Centro', '16734', 'Guanajuato', 'Irapuato', 'karlygon', 'karliyaz786'),
('Elizabeth', 'Hernandez','Ramirez', '1998-12-30', 17, '4291001256', '4291009876', 'Femenino', 'elyram@hotmail.com', 'Calle Alcatraz#48', '12356', 'Guanajuato', 'Abasolo', 'eliramirez','3112eli'),
('Maria', 'Negrete', 'Gonzalez', '1998-12-17', 17, '4291234567', '4621345678', 'Femenino', 'marineg@hotmail.com', 'Calle Rosas#30', '64537', 'Guanajuato', 'Irapuato', 'marinegrete', 'marygon123'),
('Efrain', 'Salaz', 'Delgado', '1997-03-15', 18, '429756123', '429856165', 'Masculino', 'mebx_gej@hotmail.com', 'Calle Jardin#98', '45323', 'Guanajuato', 'Irapuato', 'efrasalaz', 'efrain180'),
('Alfredo', 'Jimenez', 'Hurtado', '1998-07-04', 17, '420910508', '4690780102', 'Masculino', 'alfr_jim@hotmail.com', 'Calle Gonza#80', '13244','Guanajuato', 'Abasolo', 'alfred', 'alfredo542'),
('Pablo', 'Ortiz', 'Rojas', '1998-12-12', 17, '4850610203', '4630360506', 'Masculino', 'pablo_@hotmail.com', 'Calle Glez#56', '12345', 'Guanajuato', 'Abasolo', 'pablort', '153ortizpab'),
('Elena', 'Rojas', 'Mendez', '1997-02-16', 18 , '4620360506', '4630369586', 'Femenino', 'Roj@hotmail.com', 'Calle Wilson#45', '89765', 'Guanajuato', 'Abasolo', 'rojasele', '856elen'),
('Rocio', 'Moreno', 'Alcantar', '1998-12-05', 17, '4620590306', '4290860705', 'Femenino', 'rosimhotmail.com', 'Calle Mora#45', '45509', 'Guanajuato', 'Abasolo', 'rosimore', 'morenorosi12'),
('Saúl', 'Hacha', 'Juarez', '1997-05-09', 18,  '4290860705', '4690580302', 'Masculino', 'hach@hotmail.com', 'Calle Watzon#45', '37680', 'Guanajuato', 'Irapuato', 'saulhacha', 'hacha1234'),
('Aaron', 'Hernández', 'Gonzalez', '1997-03-14', 18, '4290150603', '4590120603', 'Masculino', 'aron58@hotmail.com', 'Calle Salazar#78', '35460', 'Guanajuato', 'Cueramaro', 'hernamdezaron', 'gonher098'),
('Rosa', 'Jimenez', 'Huerta', '1997-07-16', 18, '4290150506', '4590320708', 'Femenino', 'ros@hotmail.com', 'Calle Guadalupe#62', '24356', 'Guanajuato', 'Cueramaro', 'rosijimen', 'huertaros'),
('Francisco', 'Castañeda', 'Rosales', '1998-06-13', 22, '4290180506', '4880960506', 'Masculino', 'frnas@hotmail.com', 'Calle Guanajuato#58', '34560', 'Guanajuato', 'Irapuato', 'francast', 'castanedarosa'),
('Elia', 'Duarte', 'Morales', '1997-11-10', 18, '4290130305', '4590860203', 'Femenino', 'eli@hotmail.com', 'Calle Emily#56', '45579', 'Guanajuato', 'Cueramaro', 'elidurte', 'duartemora11'),
('Fabián', 'Castro', 'Herrera','1998-10-13', 17, '4290860705', '4620360809', 'Masculino', 'fabi@hotmail.com', 'Calle Kinto#58', '56589', 'Guanajuato', 'Cueramaro', 'fabiancastro', 'castrofab34'),
('Karen', 'Uribe', 'Garcia', '1998-12-14', 17, '4290150678', '4590320708', 'Femenino', 'anak@hotmail.com', 'Calle Mina#78', '25480', 'Guanajuato', 'Irapuato', 'kariurib', 'garciauri'),
('María', 'Meza', 'Rios', '1997-07-12', 18, '429756123', '429156230', 'Femenino', 'mari@hotmail.com', 'Calle Matamoros#45', '35580', 'Guanajuato', 'Abasolo', 'mezamari', 'mezamaria12'),
('Rihanna', 'Castro', 'Mendez', '1998-08-25', 17, '429812365', '429123365', 'Femenino', 'kard@gmail.com', 'Calle Roma#74', '57808', 'Guanajuato', 'Irapuato', 'rihancas', 'casstrorihan'),
('Daniel', 'Garcia', 'Vazquez', '1997-04-16', 18, '429785632', '429568137', 'Masculino.', 'daniel@hotmail.com', 'Calle Tijuana#78', '57899', 'Guanajuato', 'Cueramaro', 'danigarcia', 'garciavazquez'),
('Ana', 'Ledezma', 'Sanches', '1998-11-29', 17, '429785632', '429156321', 'Femenino.', 'an@hotmail.com', 'Calle Irapuato#45', '32677', 'Guanajuato', 'Cueramaro', 'anniledesma', 'sanchesanny'),
('Alexa', 'Contreras', 'Vargas', '1998-03-13', 17, '429451577', '429756123', 'Femenino', 'alecon@hotmail.com', 'Calle Potosina#40', '12345', 'Guanajuato', 'Irapuato', 'alexvargas', 'contrealexa'),
('Alan', 'Pacheco', 'Duarte', '1997-11-23', 18, '459126354', '4290180506', 'Masculino', 'alanpach@hotmail.com', 'Calle Miramor#89', '45870', 'Guanajuato', 'Irapuato', 'pachecoalan', 'duartepachaco18'),
('Pablo', 'Gallo', 'Moreno', '1997-02-23', 18, '4290180506', '4290150603', 'Masculino', 'gall_hhe@hotmail.com', 'Calle Mina#56','16689',  'Guanajuato', 'Abasolo', 'gallomoren', 'pablomoreno096'),
('Margarita', 'Bravo', 'Mendeza', '1998-05-27', 17, '429756123', '429451577', 'Femenino', 'mar_br@hotmail.com', 'Calle Hortelas#23', '65990', 'Guanajuato', 'Abasolo', 'margaritabra', 'bravomend85'),
('Gissel', 'Diaz', 'Ramirez', '1997-03-17', 18, '429451577', '429756123', 'Femenino', 'gisseldia_@hotmail.com', 'Calle Kino#78', '64786', 'Guanajuato', 'Abasolo', 'diazgissel', 'ramirezdiaz45'),
('Juan', 'Martinez', 'Ceballos', '1998-04-30', 17, '4290180506', '4290150603', 'Masculino', 'juan@hotmail.com', 'Calle Primavera#23', '76903', 'Guanajuato', 'Abasolo', 'martinezjuan', 'martinezceballos848'),
('Paola', 'Martinez', 'Guerra', '1998-05-17', 17, '4290150567', '4290150645', 'Femenino', 'paomarti@hotmail.com', 'Calle Juarez#80', '56680', 'Guanajuato', 'Irapuato', 'martinezpao', 'paoguerramar74'),
('Guadalupe', 'Fernandez', 'Garcia', '1997-06-28', 18, '429785632', '429123365', 'Femenino', 'lupefernamdez@hotmail.com', 'Calle Juarez#80', '39600', 'Guanajuato', 'Cueramaro', 'lupitagarcia', 'lupisferna850')
GO

-- REGISTROS DE LA TABLA RESPUESTAS:
INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 25, 'Existen 88 constelaciones', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 44, 'Andrómeda, Aquila, Ara, Argo Navis, Auriga', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 261, 'La diferencia es enorme, una galaxia es una agrupación de miles de millones de estrellas y gigantescas nubes de gas y polvo, una constelación no es más que una agrupación de estrellas que vistas desde la tierra se les puede asiganar forma gracias a los humanos', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 73, 'No, el sol no forma parte de alguna constelación al menos no en la tierra', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 137, 'Son agrupaciones de estrellas que se unen mediante trazos imaginarios y forman una silueta que adquiere figuras singulares y reconocibles', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 128, 'El sistema solar externo está formado por los 4 planetas gigantes: Júpiter, Saturno, Urano y Neptuno, y sus casi 200 satélites', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 197, 'Es el cuarto planeta en orden de colocación en el Sistema Solar, y el segundo más pequeño. Está situado al borde del “cinturón” de asteroides, en la parte interior, y es vecino de nuestro planeta', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 211, 'Los científicos astrónomos calculan que sólo en la Vía Láctea (nuestra galaxia), hay 300 mil millones de estrellas, y que en el universo total, podría haber, tantas galaxias, como estrellas hay en la Vía Láctea', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 300, 'El Sol, en su proceso vital, se encuentra ahora en lo que los astrónomos llaman “la secuencia principal”, la cual, en palabras más comprensibles, puede ser llamada también, etapa de “vida útil”, según los modelos usados en la astronomía, todavía brillará establemente otros 5 mil millones de años', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 37, 'Alexey  Leovonov  18 de Marzo de 1965', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 44, 'Cuentan con una bolsa de 1.9 litros de agua', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 70, 'La penda cuenta con un sistema de recolección de orina y haces facales', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 121, 'Los trajes espaciales poseen 91.5  metros de pequeñas tuberías por donde circula agua con el fin de refrigerar el cuerpo', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 10, 'En cohetes', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 38, 'Para los científicos especializados no', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 25, '1 año, 1 mes, y 2 semanas', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 28, '3 días, 3 horas, 49 minutos', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 115, 'Son espacios suspendidos en el espacio  que reciben ondas de radiocomunicación y las reflejan de nuevo a la tierra', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 46, 'Genímedes es el satélite más grande de Júpiter', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 9, 'Andrastea', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 68, 'Por sus ¨alas¨ que son paneles que transforman la luz en combustible', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 143, 'Los de comunicaciones que son los geoestacionarios (GEO), los que reflejan la señal  llamados pasivos y los que la amplifican llamados activos', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 77, 'Mercurio, Venus, la Tierra, Marte, Júpiter, Saturno, Urano, Neptuno y Plutón', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 8, 'Mercurio', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 20, 'Todo cuerpo celeste', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 94, 'A esos planetas se les conoce como exoplanetas, pueden encontrarse alrededor de las estrellas', 1)

INSERT INTO respuestas(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 40, 'No, la luz que vemos la reflejan del Sol', 1)
GO

-- REGISTROS DE LA TABLA PREGUNTAS:
INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 26, 'opcion multiple', '¿Cuantas constelaciones hay?', 'Medio', 9,9,9,9,9,9,9,9)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 33, 'opcion multiple', '¿Cuales son algunas constelaciones?', 'Medio', 1,1,1,1,1,1,1,1)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 55, 'opcion multiple', '¿Que diferencia hay entre una galaxia y una constelación?', 'Medio', 2,2,2,2,2,2,2,2)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 41, 'opcion multiple', '¿El sol forma parte de alguna constelación?', 'Medio', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 23, 'opcion multiple', '¿Que es una constelación?', 'Bajo', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 44, 'opcion multiple', '¿Que se entiende por el sistema solar interno?', 'Medio', 5,5,5,5,5,5,5,5)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 39, 'opcion multiple', '¿Que nos dirías acerca del planeta Marte?', 'Bajo', 6,6,6,6,6,6,6,6)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 30, 'opcion multiple', '¿Cuantos tipos de estrellas hay?', 'Bajo', 7,7,7,7,7,7,7,7)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 38, 'opcion multiple', '¿Hasta cuando va a durar estable el sol?', 'Meio', 8,8,8,8,8,8,8,8)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 51, 'opcion multiple', '¿Primer ser humana que realiza una caminata espacial?', 'Medio', 1,1,1,1,1,1,1,1)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 45, 'opcion multiple', '¿Con que cuentan los trajes de los astronautas?', 'Medio', 2,2,2,2,2,2,2,2)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 101, 'opcion multiple', '¿Cómo hacen del baño los astronautas durante las caminatas espaciales, si no se pueden quitar el traje?', 'Medio', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 38, 'opcion multiple', '¿Refrigeración de los trajes espaciales?', 'Medio', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 25, 'opcion multiple', '¿En que se puede viajar?', 'Bajo', 6,6,6,6,6,6,6,6)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 17, 'opcion multiple', '¿Tiene algún costo?', 'Bajo', 7,7,7,7,7,7,7,7)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 31, 'opcion multiple', '¿Cuanto tiempo tarda ese viaje?', 'Bajo', 8,8,8,8,8,8,8,8)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 47, 'opcion multiple', '¿Cuales son las misiones tripuladas más rápidas?', 'Medio', 9,9,9,9,9,9,9,9)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 23, 'opcion multiple', '¿Que son los satélites?', 'Bajo', 1,1,1,1,1,1,1,1)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 63, 'opcion multiple', '¿Cual es el satélite más grande que existe en el sistema solar?`', 'Medio', 2,2,2,2,2,2,2,2)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 60, 'opcion multiple', '¿Cual es el satélite más pequeño existe en el sistema solar?', 'Medio', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 26, 'opcion multiple', '¿Como funciona un satélite?', 'Medio', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 18, 'opcion multiple', '¿Tipos de satélites?', 'Medio', 5,5,5,5,5,5,5,5)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los planetas', 45, 'Opción Multiple', '¿Cuáles son los 9 planetas del sistema solar?', 'Bajo',1,1,1,1,1,1,1,1)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los planetas', 39, 'Opción Multiple', '¿Cuál es el planeta más cercano al sol?', 'Medio',2,2,2,2,2,2,2,2)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('los planetas', 17, 'opcion multiple', '¿que es un planeta?', 'Bajo', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('los planeta', 55, 'opcion multiple', '¿que sucede con los planetas que estan en otros sitios?', 'Medio', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('los planeta', 32, 'opcion multiple', '¿Tienen luz propia los planetas?', 'Medio', 5,5,5,5,5,5,5,5)
GO


-- REGISTROS DE LA TABLA EVALUACIONES (1 registro)
INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Satelites Naturales', 10,'2000-10-02 01:15:13', 1, 1, 1)
GO
-- VARIOS REGISTROS
INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Constelaciones',10, '2000-10-02 00:15:13', 2, 2, 2)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronautas', 9,'2000-10-02 0:55:10', 3, 3, 3)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Planetas', 9,'1999-10-04 01:23:14', 4, 4, 4)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Asteroides', 9,'2007-03-10 02:33:54', 5, 5, 5)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Estrellas', 9,'2007-03-10 02:33:54',6, 6, 6)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Naves',9,'2007-03-10 02:33:54', 7, 7, 7)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Satelites', 9,'2007-03-10 02:33:54', 8, 8, 8)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Satelites naturales', 9,'2007-03-10 02:33:54',9, 9, 9 )

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronautas', 9,'2007-03-10 02:33:54', 10, 10, 10)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Hoyos negros', 9,'2007-03-10 02:33:54', 11, 11, 11)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Sistemas', 9,'2011-07-12 00:34:24', 12, 12, 12 )

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Rocas', 9,'2007-03-10 02:33:54', 13, 13, 13)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Sinturones', 10,'2007-03-10 02:33:54', 14, 14, 14)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Estrellas fugases', 10,'2007-03-10 02:33:54', 15, 15, 15)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronaves', 10,'1999-04-12 00:34:34',16, 16, 16)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cometas',10, '2006-06-09 00:47:28', 17, 17, 17 )

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Galaxias', 10,'2007-03-10 02:33:54', 18, 18, 18)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cuásares', 4,'2007-03-10 02:33:54',19, 19, 19)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulo globular', 4,'2007-03-10 02:33:54', 20, 20, 20)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Nebulosas brillantes', 4,'2007-03-10 02:33:54', 21, 21, 21)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulos abiertos', 6,'2007-03-10 02:33:54', 22, 22, 22)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Nebulosas', 6,'2007-03-10 02:33:54', 23, 23, 23)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Nebulosas oscuras', 6,'2007-03-10 02:33:54', 24, 24, 24)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulos de estrellas', 6,'2007-03-10 02:33:54',25, 25, 25)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulos de estrellas', 5,'2010-04-04 01:33:00', 26, 26, 26)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Galaxias', 3,'2010-05-11 02:20:38', 27, 27, 27)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Asteroides', 2,'2007-03-10 02:33:54', 28, 27, 27)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronautas', 1,'2007-03-10 02:33:54', 29, 27, 27)

INSERT INTO evaluaciones(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Estrellas', 8,'2010-03-01 01:23:43', 30, 27, 27)
GO

-- REGISTROS DE LA TABLA ESCUELAS (1 registro)
INSERT INTO escuelas(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web, id_usuario)
VALUES('José Maria Morelos', 'Publica', 'Basico', 'Hector Hernández Robles', 'Colonia Pedregal Calle Los Arcos #741', '1234567890', 'jmariamorelos@hotmail.com', 'www.josemariamoles.gob.mx', 1)
GO

-- VARIOS REGISTROS
INSERT INTO escuelas(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web, id_usuario)
VALUES('Benito Juarez', 'Publica', 'Basico', 'Javier Camarillo Duarte', 'Estacion Joaquin', '4291139023', 'benijua@hotmail,com', 'www,benitojuarez.gob.mx', 2),

('Justo Sierra', 'Publica', 'Basico', 'Luis Martinez Luna', 'Estacion Joaquin', '4291236453', 'justsie@hotmail.com', 'www,justosier.gob.mx', 3),
('Nicolas Bravo', 'Publica', 'Basico', 'Sonia Ramirez Beltran', 'Calle Bolaños#45', '4299364574', 'nicobrav@hotamail.com', 'www,nicolasbrav.gob.mx', 4),
('Emiliano Zapata', 'Publica', 'Basico', 'Ramon Vargas Noriega', 'Calle 20Sep#70', '4625437634', 'emilizap@hotmail.com', 'www.emilizap.gob.mx', 5),
('Josefa Ortiz De Dominguez', 'Publica', 'Basico', 'Maria Leon Cervantes', 'Calle Degollado#45', '4299074567', 'joseort@hotmail.com', 'www.joseort.gob.mx', 6),
('Heroes De Chapultepec', 'Publica', 'Basico', 'Jose Martinez Ceballos', 'Calle Alba#12', '4621345564', 'heroeschap@hotmail.com', 'www.heroeschapul.gob.mx',7),
('Ignacio Allende', 'Publica', 'Basico', 'Fernando Ramirez HUerta', 'Calle Mina#78', '4293456789', 'ignacioalle@hotmail.com', 'www.ignacioalle.gob.mx',8),
('Juan Escutia', 'Publica', 'Baasico', 'Rosa Contreras Mendez', 'Calle Degollado#48', '4291234567', 'juanescut@hotmail.com', 'www.juanescutia.gob.mx',9),
('Carmen Ramos Del Rio', 'Publica', 'Basico', 'David Morales Juarez', 'Calle Valle#26', '4292357890', 'carmenram@hotmail.com', 'www.carmenramos.gob.mx',10),
('Francisco I Madero', 'Publica', 'Basico', 'Manuel Cervantes Rios', 'Calle Bolaños#49', '4629074567', 'francismad@hotmail.com', 'www.franciscomader.gob.mx',1),
('20 de Noviembre', 'Publica', 'Basico', 'Diana Luna Ponce', 'Calle Salazar#72', '429564237', '20nov@hotmail.com', 'www.20noviem.gob.mx',12),
('18 de Marzo', 'Publica', 'Basico', 'Raul Mendez Rojas', 'Calle Alba#19', '4292094523', '18marz@hotmail.com', 'www.1marzo.gob.mx',13),
('Las Naciones Unidas', 'Publica', 'Basico', 'Natalia Aguirre Galvan', 'Calle 20Sep#78', '4298756356', 'naciuni@hotmail.com', 'nacionunid.gob.mx',14),
('Lazaro Cardenas', 'Publica', 'Basico', 'Juan Zavala Rios', 'Calle Valle#25', '429123456', 'lazcard@hotmail.com', 'www.lazcarde.gob.mx',15),
('Benisario Dominguez', 'Publica', 'Basico', 'Dana Elizarraraz Noriega', 'Calle Guadalupe#62', '4621876530', 'benidom@hotmail.com', 'benisadomin.gob.mx',16),
('Cuahutemoc', 'Publica', 'Basico', 'Alan Rocha Gonzalez', 'Calle Guadalupe#55', '462965643', 'cuahu@hotmail.com', 'www.cuahutemoc.gob.mx',17),
('Miguel Hidalgo', 'Publica', 'Basico', 'Teresa Martinez Bravo', 'Calle Salazar#78', '4297654439', 'miguehidal@hotmail.com', 'www.miguelhidal.gob.mx',18),
('Morelos I Pavon', 'Publica', 'Basico', 'Elena Gonzalez Balandran', 'Calle Bolaños#23', '429145679', 'morelpav@hotmail.com', 'www.morelosipav.gob.mx',19),
('Benustiano Carranza', 'Publica', 'Basico', 'Susana Elizarraraz Rosales', 'Calle Matamoros#45', '42931256709', 'benustcarran@hotmail.com', 'www.benustianocarranza.gob.mx',20),
('Benito Juarez', 'Publica', 'Basico', 'Rubi Ramirez Guerra', 'Calle Roma#74', '4620985674','benitojuarez@hotmail.com', 'www.benitojuarez.gob.mx',21),
('Ignacio Allende', 'Publica', 'Basico', 'Carla rodriguez Gonzalez', 'Calle Morelos#34', '4291003608', 'ignallen@hotmail.com', 'www.ignacioallende.gob.mx',22),
('Carlos Cortes', 'Publica', 'Basico', 'Elizabeth Ramirez Hernandez', 'Calle Mina#78', '4621456709', 'carlocort@hotmsil.com', 'www.crloscortes.gob.mx',23),
('Macrina', 'Publica', 'Basico', 'Liliana Gonzalez Nuñez', 'Calle Troya#48', '429456723', 'macrina@hotmail.com', 'www.macrina,gob.mx',24),
('Miguel Hidalgo', 'Publica', 'Basico', 'Elia Guerrero Noriega', 'Calle Italia#40', '4291023465', 'miguelhidal@hotmail.com', 'www.miguelhidalgo.gob.mx',25),
('Guadalupe Victoria', 'Publica', 'Basico', 'Fabian Alcantar Guerrero', 'Calle Matamoros#49', '4624539078', 'guadalupvic@hotmail.com', 'www.guadalupevictori.gob.mx',26),
('Pancho Villa', 'Publica', 'Basico', 'Leonor Guerra Rojas', 'Calle Italia#45', '4291236798', 'panchov@hotmail.com', 'www.panchovilla.gob.mx',27),
('Sor Juana Ines De La Cruz', 'Publica', 'Basico', 'Gerardo Banda Soza', 'Calle Troya#47', '4623456789', 'sorjuain@hotmail.com', 'www.sorjuanainesdelacruz.gob.mx',28)
GO

-- Separar base de datos
use master
Go
SP_DETACH_DB @DBNAME = 'bdshowuniverse'
GO

-- Adjuntar base de datos
USE master
GO
CREATE DATABASE bdshowuniverse
ON (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdshowuniverse.MDF'),
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdshowuniverse.NDF'),
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdshowuniverse.LDF')
FOR ATTACH;
GO

-- Mostrar CADA UNA DE LAS Tablas
use bdshowuniverse
go
select name as [NOMBRE DE LA TABLA] from sysobjects where type='U'
GO
-- Mostrar todas las bases de datos Menos las del SISTEM
SELECT name FROM master.dbo.sysdatabases WHERE name NOT IN ('master','model','msdb','tempdb')
GO

--<<<<<<<<<<<<<<<<------------------------ CÓDIGO APARTE---------------------------------------------------------------->>>>>>>>>>>>
--<<<<<<<<<<<-- CREAR LAS TABLAS Y REGISTROS 2 PARA CONSULTAS DE UNION --------------------------------------------->>>>>>>>>>>>>>>>>>>

-- CREACIÓN DE LAS TABLAS
-- Crear la tabla PLANETAS2
CREATE TABLE planetas2(
id_planeta smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(30) NOT NULL unique,
diametro_ecuatorial real NOT NULL,
masa real NOT NULL,
periodo_orbital_anos real NOT NULL,
periodo_de_rotacion_dias real NOT NULL,
imagen image NULL,
id_satelite smallint  NULL,
id_constelacion smallint  NULL
 )

-- Crear la tabla SATELITES2
CREATE TABLE satelites2(
id_satelite smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(30) NOT NULL,
diametro int NOT NULL,
periodo_orbital varchar(40) NOT NULL,
ubicacion varchar(80) NOT NULL,
tamano char(9) NOT NULL,
tipo_satelite varchar(20) NOT NULL,
imagen image NULL)

-- Crear la tabla VIAJES2
CREATE TABLE viajes2(
id_viaje smallint NOT NULL PRIMARY KEY identity(1,1),
lugar_salida varchar(40) NOT NULL,
destino varchar(60) NOT NULL,
duracion varchar(20) NULL,
proposito varchar(MAX) NOT NULL,
numero_integrantes smallint NOT NULL,
encargado varchar(60) NOT NULL,
foto_encargado image NULL,
nombre_viaje varchar(30) NOT NULL,
tipo varchar(20) NOT NULL,
id_astronauta smallint  NULL,
id_transporte smallint  NULL,
id_planeta smallint  NULL,
id_satelite smallint  NULL,
id_constelacion smallint  NULL,
id_observatorio smallint  NULL
)

-- Crear la tabla ASTRONAUTAS2
CREATE TABLE astronautas2(
id_astronauta smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(40) NOT NULL,
edad tinyint NOT NULL,
fecha_nacimiento date NOT NULL,
estatura real NULL,
correo varchar(30) NOT NULL,
telefono char(10) NOT NULL,
foto image NULL)

-- Crear la tabla MEDIOS DE TRANSPORTE2
CREATE TABLE medios_transporte2(
id_transporte smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(40) NOT NULL,
tamano char(10) NOT NULL,
capacidad_personas tinyint NOT NULL,
tipo varchar(40) NOT NULL,
dueno varchar(70) NOT NULL,
velocidad_max real NULL,
imagen image NULL,
id_astronauta smallint  NULL)

-- Crear la tabla PREGUNTAS2
CREATE TABLE preguntas2(
id_pregunta smallint NOT NULL PRIMARY KEY identity(1,1),
tema varchar(60) NOT NULL,
longitud int NULL,
tipo varchar(35) NOT NULL,
pregunta varchar(690) NOT NULL unique,
grado_dificultad varchar(35) NOT NULL,
id_respuesta smallint  NULL,
id_planeta smallint  NULL,
id_satelite smallint  NULL,
id_viaje smallint  NULL,
id_constelacion smallint  NULL,
id_observatorio smallint  NULL,
id_astronauta smallint  NULL,
id_transporte smallint  NULL)

-- Crear la tabla RESPUESTAS2
CREATE TABLE respuestas2(
id_respuesta smallint NOT NULL PRIMARY KEY identity(1,1),
tipo varchar(60) NOT NULL,
longitud int NULL,
respuesta varchar(690) NOT NULL unique,
id_usuario smallint  NULL)

-- Crear la tabla CONSTELACIONES2
CREATE TABLE constelaciones2(
id_constelacion smallint NOT NULL PRIMARY KEY identity(1,1),
nombre_en_latin varchar(55) NOT NULL,
nombre_en_espanol varchar(55) NOT NULL,
elemento varchar(50) NOT NULL,
simbolo image NULL,
duracion_tropical varchar(50) NOT NULL,
domicilio varchar(70) NOT NULL,
imagen image NULL)

-- Crear la tabla EVALUACIONES2
CREATE TABLE evaluaciones2(
id_evaluacion smallint NOT NULL PRIMARY KEY identity(1,1),
tema varchar(50) NOT NULL,
puntuacion tinyint NOT NULL,
fecha_duracion smalldatetime NOT NULL,
id_usuario smallint  NULL,
id_pregunta smallint  NULL,
id_respuesta smallint  NULL)

-- Crear la tabla OBSERVATORIOS2
CREATE TABLE observatorios2(
id_observatorio smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(90) NOT NULL,
direccion varchar(490) NOT NULL,
dueno varchar(90) NOT NULL,
pais varchar(60) NOT NULL,
tamano varchar(15) NOT NULL,
fecha_creacion date NOT NULL,
imagen image NULL,
id_constelacion smallint  NULL,
id_planeta smallint  NULL,
id_satelite smallint  NULL)

-- Crear la tabla 
CREATE TABLE usuarios2(
id_usuario smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(40) NOT NULL,
apellido_p varchar(40) NOT NULL,
apellido_m varchar(40) NULL,
fecha_nacimiento date NOT NULL,
edad tinyint NOT NULL,
telefono_celular varchar(15) NULL,
telefono_casa varchar(15) NULL,
sexo varchar(25) NOT NULL,
correo varchar(55) NOT NULL unique,
domicilio varchar(450) NOT NULL,
codigo_postal char(9) NOT NULL,
estado varchar(55) NOT NULL,
ciudad varchar(55) NOT NULL,
nombre_usuario varchar(50) NOT NULL unique,
pass varchar(50) NOT NULL unique)

-- Crear la tabla
CREATE TABLE escuelas2(
id_escuela smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(60) NOT NULL,
tipo varchar(50) NOT NULL,
nivel_escolar varchar(55) NOT NULL,
director varchar(70) NOT NULL,
ubicacion varchar(480) NOT NULL,
telefono varchar(15) NOT NULL,
correo varchar(60) NOT NULL unique,
pagina_web varchar(60) NULL unique,
id_usuario smallint  NULL)
GO

-- CREACIÓN DE LOS REGISTROS
-- REGISTROS DE LA TABLA SATELITES:
INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Luna', 3476, '27d 7h 43.7m', 'Tierra', 'Mediano', 'Natural')
GO

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Io', 3643, '1d 18h 27.6m', 'Jupiter', 'mediano', 'natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Europa', 3122, '3.551181d', 'Jupiter', 'Mediano', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Ganimedes', 5262, '7d 3h 42.6m', 'Jupiter', 'Grande', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Calisto', 4821, '16.6890184d', 'Jupiter', 'Grande', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Titan', 5162, '15d 22h 41m', 'Saturno', 'Grande', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Tetis', 1062, '1.888d', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Dione', 1118, '2.736915d', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Rea', 1529, '4.518d', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Japeto', 1436, '79d 19h 17m', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Mimas', 416, '22h 37m', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Encelado', 499, '32h 53m', 'Saturno', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Miranda', 472, '1.413d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Ariel', 1162, '2.520d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Umbriel', 1172, '4.144d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Titania', 1577, '8.706d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Oberon', 1523, '13.46d', 'Urano', 'Pequeno', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Triton', 2707, '-5.877d', 'Neptuno', 'Mediano', 'Natural')

INSERT INTO satelites2(nombre, diametro, periodo_orbital, ubicacion, tamano, tipo_satelite)
VALUES('Caronte', 1207, '6.387230d', 'Pluton', 'Pequeno', 'Natural')
GO

-- REGISTROS DE LA TABLA CONSTELACIONES:
INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Aries', 'Aries el carnero', 'Fuego', 'Marzo21-Abril20', 'Marte')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Taurus', 'Tauro el toro', 'Tierra', 'Abril21-Mayo21', 'Marte')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Gemini', 'Geminis los gemelos', 'Aire', 'Mayo22-Junio21', 'Mercurio')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Cancer', 'Cancer el cangrejo', 'Agua', 'Junio22-Julio22', 'Luna')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Leo', 'Leo el leon', 'Fuego', 'Julio22-Agosto23', 'Sol')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Virgo', 'Virgo la virgen', 'Tierra', 'Agosto23-Septiembre22', 'Mercurio')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Libra', 'Libra la balanza', 'Aire', 'Septiembre23-Octubre23', 'Venus')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Escorpio', 'Escorpio el escorpion', 'Agua', '0ctubre23-Noviembre21', 'Pluton y Marte')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Sagittarius', 'Sagitario el arqueo', 'Fuego', 'Noviembre22-Diciembre21', 'Jupiter')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Capricornus', 'Capricornio la cabra de mar', 'Tierra', 'Diciembre22-Enero20', 'Saturno')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Aquarius', 'Acuario el aguador o portador de agua', 'Aire', 'Enero21-Febrero19', 'Saturno o Urano')

INSERT INTO constelaciones2(nombre_en_latin, nombre_en_espanol, elemento, duracion_tropical, domicilio)
VALUES('Piscis', 'Piscis los peces', 'Agua', 'Febrero20-Marzo20', 'Neptuno o Jupiter')
GO

-- REGISTROS DE LA TABLA PLANETAS:
INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Mercurio', 0.3854587, 0.06, 0.38, 0.241, 1, 1)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Venus', 0.949, 0.82, 0.72, 0.615, 2, 2)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Tierra', 1.00, 1.00, 1.00, 1.00, 3, 3)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Marte', 0.53, 0.11, 1.52, 1.88, 4, 4)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Jupiter', 11.2, 318, 5.20, 11.86, 5, 5)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Saturno', 9.41, 95, 9.55, 29.46, 6, 6)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Urano', 3.98, 14.6, 19.22, 84.01, 7, 7)

INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Neptuno', 3.81, 17.2, 30.06, 164.79, 8, 8)
-- VARIOS REGISTROS
INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Ceres',  952.4, 0.00016, 4.599, 0.3781, 9, 9)
INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Pluton', 2302, 0.82, 247.92, -6.3872, 10,10)
INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Haumea', 0.09, 0.0007, 285.4, 0.167 ,11,11)
INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Makemake', 0.12, 0.0007, 309.9, 0.168, 12, 12)
INSERT INTO planetas2(nombre, diametro_ecuatorial, masa, periodo_orbital_anos, periodo_de_rotacion_dias, id_satelite, id_constelacion)
VALUES('Eris', 2398, 0.0028, 557,0.169, 13, 12)
GO

-- REGISTROS DE LA TABLA ASTRONAUTAS (1 registro)
INSERT INTO astronautas2(nombre, edad, fecha_nacimiento, estatura, correo, telefono)
VALUES('Juan Luis', 40, '1979-02-19', 1.80, 'Juanitogalan@hotmail.com', '4298761234')
GO

-- VARIOS REGISTROS
INSERT INTO astronautas2(nombre, edad, fecha_nacimiento, estatura, correo, telefono)
VALUES('Guadalupe Ramíres', 34, '1977-04-23', 1.79, 'Lupe736_w@hotmail.com', '4291827272'),
('Alan Castillo', 46, '1971-06-14', 1.68, 'Alan_Ortuga@outlook.com', '4628329392'),
('Luis Antonio Delgado', 32, '1980-04-23', 1.82, 'Luisan_34@hotmail.com','4291004623'),
('Yahir Ortega ledesma', 38, '', 1.78, 'Yahirito_45d@hotmail.com', '4283990193'),
('Luis Angel Arellano', 45, '', 1.76, 'Angelito_23@outlook.com', '4291847383'),
('Marco Antonio Rios', 39, '', 1.80, 'MArco_93ks@hotmail.com', '4628119303'),
('David Velazquez', 46, '', 1.78, 'Daviddj32@outlook.com', '4291002934'),
('Fernando Vaszquez', 50, '', 1.82, 'Fer_2932@hotmail.com', '4293829173'),
('Mauricio Uribe', 46, '', 1.80, 'Maulizo@hotmail.com', '7326373328'),
('Rogelio Hurtado', 54, '', 1.78, 'Roge_273@hotmail.com', '4201291283'),
('Joel Castro', 43, '', 1.80, 'JoelCastillo_23s@hotmail.com','4292837432'),
('José Fernando Gallo', 39, '', 1.82,'JosFer_342@hotmail.com', '4362718239'),
('Diego Ponce', 62, '', 1.82, 'Diegomsu_23@outlook.com', '4291004987'),
('Jorge Hernandes', 54, '', 1.80, 'Jorgedmil_32@hotmail.com', '4362718832'),
('Manuel Lopez Parra', 51, '', 1.78, 'Manuel_23d@gmail.com', '4292938273'),
('William Shakespeare', 50, '', 1.82, 'wili_472@hotmail.com', '4293817328'),
('Oscar Arrollo', 43, '', 1.80, 'Oscararoojo_ew@hotmail.com', '4291837323'),
('Barbara Corman', 33, '', 1.75, 'Barbaracor_56@outlook.com', '4839990329'),
('Jorge Alejandro Martines', 39, '', 1.79, 'jorgeAle_32@hotmail.com', '4298272356'),
('Luis Enrique Garmendia', 43,'', 1.80,'Luisingermen23@hotmail.com', '4392304528'),
('Javier Vaca', 43, '', 1.78, 'JaviVaca_32@outlook.com', '4283920837'),
('Abdullah Jones', 42, '', 1.85, 'Abdulaahjon_32@hotmail.com', '4291938648'),
('Devyn Wilson', 46, '', 1.82, 'Awilson_23ed@outlook.com', '4527839047'),
('Kevin Levin', 33, '', 1.76, 'Kevinlevin234@hotmail.com', '4291004385'),
('Dillan Lewis', 37, '', 1.89, 'dillaneir_34@gmail.com', '4356789254'),
('Joey Harris', 54, '', 1.80, 'joeyharri_43@gmail.com', '4291873628'),
('Phoenix Scott', 39, '', 1.76, 'phonix445@hotmail.com', '8392736728'),
('Peyton Hill', 45, '', 1.80, 'peyton34_w23@hotmail.com', '4291092833'),
('Alonso Baker', 43, '', 1.76, 'alonso-453@outlook.com', '3928837485'),
('Edward Nelson', 33, '', 1.84, 'edwarf-443@gmail.com', '4291077957')
GO

-- REGISTROS DE LA TABLA MEDIOS_TRANSPORTE (1 registro)
INSERT INTO medios_transporte2(nombre, tamano, capacidad_personas, tipo, dueno, velocidad_max, id_astronauta)
VALUES('Raptor', 'Grande', 9, 'Transbordador', 'LA NASA', 153.43, 1)
GO

-- VARIOS REGISTROS
INSERT INTO medios_transporte2(nombre, tamano, capacidad_personas, tipo, dueno, velocidad_max, id_astronauta)
VALUES('thuner242', 'Mediano', 5, 'Trasbordador', 'La NASA', 148.34, 2),
('Travel56', 'Grande', 9, 'Trasbordador', 'La NASA', 173.38, 3),
('Fish4', 'Chico', 3, 'Trasbordador', 'La NASA',320.54, 4),
('skull23', 'Grande', 10, 'Trasbordador', 'La NASA', 534.43, 5),
('Travel',  'Grande', 11, 'Trasbordador', 'La NASA', 143.45, 6),
('Super-Pumpe', 'Chico', 4, 'Trasbordador', 'La NASA', 232.34, 7),
('Hero2', 'Grande', 14, 'Trasbordador', 'La NASA', 434.34, 8),
('MAnOZ8', 'Mediano', 5, 'Trasbordador', 'La NASA', 186.45, 9),
('Candy', 'Grande', 6, 'Trasbordador', 'La NASA', 124.34, 10),
('thuner4.5', 'Chico', 4, 'Trasbordador', 'La NASA', 183.23, 11),
('Asteroid','Chico', 4, 'Trasbordador', 'La NASA', 123.53, 12),
('Event Horizon', 'Grande', 11, 'Trasbordador', 'La NASA', 422.4, 13),
('Serenity', 'Mediano', 7, 'Trasbordador', 'La NASA', 234.53, 14),
('Travel453', 'Mediano', 9, 'Trasbordador', 'La NASA', 134.43, 15),
('Joss Whedon', 'Chico',2, 'Trasbordador', 'La NASA', 148.34, 16),
('Enterprise', 'Mediano', 7, 'Trasbordador', 'La NASA', 372.23, 17),
('Star treck', 'Grande', 14, 'Trasbordador', 'La NASA', 826.43, 18),
('thuner43.4', 'Chico', 3, 'Trasbordador', 'La NASA', 638.54, 19),
('Battlestar Galactica', 'Grande', 19, 'Trasbordador', 'La NASA', 892.24, 20),
('Close Encounters of the Third Kind', 'Mediano', 8, 'Trasbordador', 'La NASA', 732.28, 21),
('Nostromo ', 'Chico', 3, 'Trasbordador', 'La NASA', 183.43, 22),
('Travel483.4', 'Mediano', 7, 'Trasbordador', 'La NASA', 173.43, 23),
(' Alien', 'Chico', 3, 'Trasbordador', 'La NASA', 382.43, 24),
('Carl Macek', 'Chico', 4, 'Trasbordador', 'La NASA', 828.43, 24),
('El Halcón Milenario', 'Grande', 20, 'Trasbordador', 'La NASA', 367.37, 25),
('Han', 'Chico', 3, 'Trasbordador', 'La NASA', 382.37, 26),
('thuneru8G', 'Chico', 3, 'Trasbordador', 'La NASA', 281.48, 27),
('Viaje a la Luna', 'Chico', 4, 'Trasbordador', 'La NASA', 873.32, 28),
('BestDay', 'Chico', 2, 'Trasbordador', 'La NASA', 102.34, 29),
('Discovery 1', 'Chico', 4, 'Trasbordador', 'La NASA', 192.38, 30)
GO

-- REGISTROS DE LA TABLA OBSERVATORIOS (1 registro)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Allegheny', 'Montañas de Allegheny, Pittsburgh, Estados Unidos', 'Universidad de Pittsburgh', 'Estados Unidos', 'Mediano', '1859-11-18', 1, 1, 1)

-- VARIOS REGISTROS
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Gemini', 'Mauna Kea, Estados Unidos', 'Consorcio Gemini y AURA', 'Estados Unidos', 'Pequeño', '1983-10-23', 2, 2, 2)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Naval de los Estados Unidos', 'Washington DC, Estados Unidos', 'James Melville Gilliss', 'Estados Unidos', 'Mediano', '1830-08-11', 3, 3, 3)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Cincinnati', 'Cincinnati, Ohio, EE.UU, Cima del Mount Lookout', 'Edwin Hubble', 'Estados Unidos', 'Mediano', '1935-08-30', 4, 4, 4)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Detroit', 'Ann Arbor, Michigan, Estados Unidos', 'Universidad de Michigan', 'Estados Unidos', 'Pequeño', '1854-04-15', 5, 5, 5)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Farpoint', '34km al Suroeste de Topeka, Kansas, Estados Unidos', 'Universidad de Kansas', 'Estados Unidos', 'Mediano', '1994-01-01', 6, 6, 6)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astronomico Nacional San Pedro Martir', 'Sierra Homonima, Baja California, Mexico', 'UNAM', 'Mexico', 'Pequeño', '1971-12-10', 7, 7, 7)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astrofisico Nacional de Tonantzintla', 'Cerro de Tonantzintla, Municipio San Andres Cholula, Puebla, Mexico', 'Luis Enrique Erro', 'Mexico', 'Pequeño', '1942-02-19', 8, 8, 8)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Arecibo', 'PR-625, Arecibo, 00612,Puerto Rico', 'Universidad Cornell', 'Puerto Rico', 'Grande', '1963-03-30', 9, 9, 9)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Echo Valley', 'Parque Provincial Algonquin, Huntsville, Canada', 'Delta Grandview Resort', 'Canada', 'Mediano', '1982-10-12', 10, 10, 10)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio William Brydone Jack', 'Fredericton, Nuevo Brunswick, Canada', 'Universidad de Nuevo Brunswick', 'Canada', 'Pequeño', '1851-05-04', 11, 11, 11)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Berlin', 'Berlin, Alemania', 'Leibniz-Gemeinschaft', 'Alemania', 'Grande', '1835-12-11', 12, 12, 12)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Archenhold', 'Berlin, Alemania', 'Friedrich Simon Archenhold', 'Alemania', 'Grande', '1896-05-01', 12, 13, 13)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Hamburgo-Bergedorf', 'Distrito de Bergedorf, Hamburgo, Alemania', 'Universidad de Hamburgo', 'Alemania', 'Mediano', '1825-09-20', 1, 13, 14)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio  Cerro de Tololo', 'Valle de Elqui, Ciudad La Serena, Coquimbo, Chile', 'AURA', 'Chile', 'Mediano', '1962-11-07', 1, 1, 15)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio del Monte Stromlo', 'Cotter Rd, Weston Creek ACT 2611, Australia', 'Universidad Nacional de Australia', 'Australia', 'Mediano', '1921-01-18', 12, 1, 16)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Siding Spring', 'Observatory Rd, Coonabarabran NSW 2357, Australia', 'Universidad Nacional de Australia', 'Australia', 'Mediano', '1962-06-29', 12, 1, 17)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Calar Alto', 'Calar Alto, Almeria, España', 'Instituto de Astrofisica de Andalucia', 'España', 'Mediano', '1973-07-14', 1, 1, 18)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Real Observatorio de Madrid', 'Calle de Alfonso Xll, 3, 28014', 'Instituto Geografico Nacional', 'España', 'Mediano', '1667-08-15', 12, 11, 19)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Real Observatorio de Greenwich', 'Blackheath Ave, London SE10 8XJ, Reino Unido', 'Rey Carlos ll de Inglaterra', 'Reino Unido', 'Mediano', '1675-08-11', 12, 5, 1)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Hadano', '1430-16 Nishitawara, Hadano, Kanagawa-Ken, 257-0027 Japan', 'Atsuo Asami', 'Japon', 'Mediano', '1995-09-01', 1, 4, 19)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astrofisico de Crimea', 'Republica de Crimea, Rusia', 'Republica Autonoma de Crimea', 'Rusia', 'Mediano', '1947-06-25', 11, 3, 1)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Astrodomi', 'Talar, partido de Tigre, Provincia de Buenos Aires, Argentina', 'IAU', 'Argentina', 'Pequeño', '2008-02-10', 10, 2, 12)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Cordoba', 'Provincia de Cordoba, Argentina', 'Universidad Nacional de Cordoba', 'Argentina', 'Mediano', '1871-10-24', 9, 1, 12)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio la Silla', 'Region de Coquimbo, Chile', 'Organizacion Nacional para la Normalizacion', 'Chile', 'Grande', '1987-10-06', 12, 6, 11)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Viena', 'Ciudad de Viena, Austria', 'Universidad de Viena', 'Austria', 'Mediano', '1753-03-20', 1, 7, 1)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Kuffner', 'Viena, Austria', 'Universidad Popular Ottakring', 'Austria', 'Mediano', '1884-07-17', 1, 8, 12)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Quito', 'Av Gran Colombia y 10 de Agosto, dentro del Parque de la Alameda, Quito 170136, Ecuador', 'Escuela Politecnica Nacional', 'Ecuador', 'Mediano', '1873-08-24', 12, 9, 1)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio de Paris', '61 Avenue de Observatoire, 75014 Paris, Francia', 'Academia de las Ciencias', 'Francia', 'Mediano', '1667-06-21', 11, 1, 11)
INSERT INTO observatorios2(nombre, direccion, dueno, pais, tamano, fecha_creacion, id_constelacion, id_planeta, id_satelite)
VALUES('Observatorio Nacional de Atenas', 'Lofos Nymfon, Thiseio, Athens 11810, Grecia', 'Baron Georgios Sinas', 'Grecia', 'Pequeño', '1842-01-30', 1, 2, 12)
GO

-- 12 constelaciones y 13 planetas2 y satelites 19
-- REGISTROS DE LA TABLA VIAJES (1 registro)
INSERT INTO viajes2(lugar_salida, destino, duracion, proposito, numero_integrantes, encargado, nombre_viaje, tipo, id_astronauta, id_transporte, id_planeta, id_satelite, id_constelacion, id_observatorio)
VALUES('Canada', 'Venus', '8 días', 'Explorar el terreno', 12, 'Emiliano Zuria Zarate', 'ExploVenus', 'Espacial', 1, 1, 1, 1, 1, 1)
GO

-- VARIOS REGISTROS
INSERT INTO viajes2(lugar_salida, destino, duracion, proposito, numero_integrantes, encargado, nombre_viaje, tipo, id_astronauta, id_transporte, id_planeta, id_satelite, id_constelacion, id_observatorio)
VALUES('Estados Unidos', 'Marte', '2 semanas', 'Observar el H2O', 5, 'Josue william', 'exposolar', 'Espacial', 2, 2, 2, 2, 2, 2),

('Canada', 'Saturno', '3 Días', 'observar piedras', 4, 'Achille ', 'Navigatorio', 'Espacial', 3, 3, 3, 3, 3, 3),

('Estados Unidos', 'Jupiter', '1 año', 'observar el planeta', 7, 'Alexandre ', 'Explorer47.3', 'Espacial', 4, 4, 4, 4, 4, 4),

('Estados Unidos', 'Saturno', '2 años', 'observar el planeta', 10, 'Apollow ', 'Explorador3.3', 'Espacial', 5, 5, 5, 5, 5, 5),

('Canada', 'Luna', '1 mes', 'Observar piedras', 7, 'August ', 'Strongexp', 'Espacial', 6, 6, 6, 6, 6, 6),
('Estados Unidos', 'Jupiter', '2 meses', 'Observar', 8, 'Ariel ', 'Raptor3G', 'Espacial', 7, 7, 7, 7, 7, 7),
('Estados Unidos', 'Venus', '3 semanas', 'Extraer piedras', 18, 'Antony ', 'Flash78A', 'Espacial', 8, 8, 8, 8, 8, 8),
('Canada', 'Luna', '1 mes 4 días', 'Observar su forma', 20, 'Andrew ', 'strongflash27', 'Espacial', 9, 9, 9, 9, 9, 9),
('Estados Unidos', 'Urano', '20 años', 'Estudiar el planeta', 14, 'Andy ', 'Dragon73.3', 'Espacial', 10, 10, 10, 10, 10, 10),
('Canada', 'Neptuno', '26 años', 'Estudiar su composición', 23, 'William ', 'SuperNep4', 'Espacial', 11, 11, 11, 11, 11, 11),

('Estados Unidos', 'Jupiter', '2 años', 'Observar e investigar', 12, 'Michael Tromp', 'FALTA NOMBRE', 'Espacial', 12, 12, 12, 12, 12, 12),

('Canada', 'Marte', '7 semanas', 'estudiar su composición', 6, 'Justin ', 'Nova2.1', 'Espacial', 13, 13, 12, 13, 1, 13),
('Estados Unidos', 'Luna', '2 meses', 'Investigar', 5, 'Alec ', 'Space27', 'Espacial', 14, 14, 1, 14, 2, 14),
('Canada', 'Saturno', '1 decada', 'investigar su estructura', 8, 'Andre ', 'countri12.3', 'Espacial', 15, 15, 2, 15, 3, 15), 

('Estados Unidos', 'Neptuno', '2 decadas', 'Estudiar elementos', 25, 'Allan ' ,'Raptor5G.2', 'Espacial', 16, 16, 3, 16, 4, 16),

('Canada', 'luna', '6 meses', 'observar la Estructura del satelite', 8, 'Noah ', 'bignavegador', 'Espacial', 17, 17, 4, 17, 5, 17),

('Estados Unidos', 'Fobos', '6 meses', 'observar su estructura', 7, 'James Delgado', 'Explorer2.3', 'Espacial', 18, 18, 5, 18, 6, 18),
('Suecia', 'Fobos', '7 meses', 'Estudiar su Composición', 8, 'Joseph Levie', 'Zerstörer3', 'Espacial', 19, 19, 6, 19, 7, 19),
('Estados Unidos', 'Venus', '8 meses', 'Investigar sus elementos', 9, 'Jackson Smilt', 'splendor34', 'Espacial', 20, 20, 7, 1, 8, 20),
('Estados Unidos', 'Jupiter', '8 meses', 'Estudiar el planeta', 11, 'James Urtado', 'DV43', 'Espacial', 21, 21, 8, 2, 1, 21),
('Canada', 'Luna', '5 meses', 'Investigar su lado oscuro', 21, 'Calvin Devin', 'RaptorUE', 'Espacial', 22, 22, 9, 3, 2, 22),

('Estados Unidos', 'Marte', '9 semanas', 'Identificar sus elementos', 12, 'Luis sprinfield', 'Dervie3', 'Espacial', 23, 23, 10, 4, 9, 23),
('Estados Unidos', 'Fobos', '3 meses', 'Observar sus rocas', 15, 'William Shut', 'Explorator32', 'Espacial', 24, 24, 11, 5, 1, 24 ),
('Estados Unidos', 'Jupiter', '1 mes 4 días', 'Observar sus rocas', 3, 'Alan Yahir Delgado', 'trueno3', 'Espacial', 25, 25, 12, 6, 2, 25),
('Estados Unidos', 'Venus', '8 meses','Estudiar el planeta', 8, 'Jacson Castro', 'EXplorador4.6', 'Espacial', 26, 26, 13, 7, 3, 26),
('Estados Unidos', 'Saturno', '9 semanas', 'Estudiar el planeta', 5, 'Danielle Levie', 'USA5V', 'Espacial', 27, 27, 1, 8, 4, 27),

('Estados Unidos', 'Venus', '1 mes 4 días', 'observar su estructura', 13, 'Ryan Clarck', 'Crack43', 'Espacial', 28, 28, 2, 9, 5, 28),
('Estados Unidos', 'Luna', '8 meses', 'Estudiar el planeta', 15, 'Isaac Hall', 'Oservatorio23', 'Espacial', 29, 29, 3, 9, 6, 29),
('Estados Unidos', 'Urano', '7 meses', 'Estudiar el planeta', 16, 'Caleb Allen', 'ViajeronUSA34', 'Espacial', 30, 30, 4, 1, 7, 30),
('Estados Unidos', 'Jupiter', '9 semanas', 'observar su estructura', 12, 'Dylan Lee', 'StrongThumer', 'Espacial', 31, 31, 5, 3, 8, 30)
GO

-- REGISTROS DE LA TABLA USUARIOS (1 registro)
INSERT INTO usuarios2(nombre, apellido_p, apellido_m, fecha_nacimiento, edad, telefono_celular, telefono_casa, sexo, correo, domicilio, codigo_postal, estado, ciudad, nombre_usuario, pass)
VALUES('Paula', 'Rocha', 'Bravo', '1998-09-13', 17, '4621264251', '', 'Femenino', 'paulaedithrochabravo@hotmail.com', 'Andrés Balvaner# 4  Col. Centro', '12345', 'Guanajuato', 'Abasolo', 'paulab', '45pau')

-- VARIOS REGISTROS
INSERT INTO usuarios2(nombre, apellido_p, apellido_m, fecha_nacimiento, edad, telefono_celular, telefono_casa, sexo, correo, domicilio, codigo_postal, estado, ciudad, nombre_usuario, pass)
VALUES('Jorge', 'Rodriguez', 'Martinez', '1997-10-11', 18, '4291132132', '4291134567', 'Masculino', 'jorgerodrimtz@hotmail.com', 'Pasteur Nte. # 25 Col. Centro', '17135', 'Guanajuato', 'Irapuato', 'martinezjorge', 'jorge123'),
('Juan', 'Lopez', 'Uribe', '1999-12-11', 16, '4291145569', '4625466756', 'Msculino', 'juribe@idiomas.udea.edu.com', 'Andrés Balvaner# 5  Col. Centro', '13425', 'Guanajuato', 'Abasolo', 'juanurib', 'uribe456'),
('Carla', 'Rodriguez', 'Gonzalez', '1999-07-07', 16, '4291003608', '42954634221', 'Femenino', 'carlyrod@hotmail.com', '5 de Mayo # 109 Col. Centro', '16734', 'Guanajuato', 'Irapuato', 'karlygon', 'karliyaz786'),
('Elizabeth', 'Hernandez','Ramirez', '1998-12-30', 17, '4291001256', '4291009876', 'Femenino', 'elyram@hotmail.com', 'Calle Alcatraz#48', '12356', 'Guanajuato', 'Abasolo', 'eliramirez','3112eli'),
('Maria', 'Negrete', 'Gonzalez', '1998-12-17', 17, '4291234567', '4621345678', 'Femenino', 'marineg@hotmail.com', 'Calle Rosas#30', '64537', 'Guanajuato', 'Irapuato', 'marinegrete', 'marygon123'),
('Efrain', 'Salaz', 'Delgado', '1997-03-15', 18, '429756123', '429856165', 'Masculino', 'mebx_gej@hotmail.com', 'Calle Jardin#98', '45323', 'Guanajuato', 'Irapuato', 'efrasalaz', 'efrain180'),
('Alfredo', 'Jimenez', 'Hurtado', '1998-07-04', 17, '420910508', '4690780102', 'Masculino', 'alfr_jim@hotmail.com', 'Calle Gonza#80', '13244','Guanajuato', 'Abasolo', 'alfred', 'alfredo542'),
('Pablo', 'Ortiz', 'Rojas', '1998-12-12', 17, '4850610203', '4630360506', 'Masculino', 'pablo_@hotmail.com', 'Calle Glez#56', '12345', 'Guanajuato', 'Abasolo', 'pablort', '153ortizpab'),
('Elena', 'Rojas', 'Mendez', '1997-02-16', 18 , '4620360506', '4630369586', 'Femenino', 'Roj@hotmail.com', 'Calle Wilson#45', '89765', 'Guanajuato', 'Abasolo', 'rojasele', '856elen'),
('Rocio', 'Moreno', 'Alcantar', '1998-12-05', 17, '4620590306', '4290860705', 'Femenino', 'rosimhotmail.com', 'Calle Mora#45', '45509', 'Guanajuato', 'Abasolo', 'rosimore', 'morenorosi12'),
('Saúl', 'Hacha', 'Juarez', '1997-05-09', 18,  '4290860705', '4690580302', 'Masculino', 'hach@hotmail.com', 'Calle Watzon#45', '37680', 'Guanajuato', 'Irapuato', 'saulhacha', 'hacha1234'),
('Aaron', 'Hernández', 'Gonzalez', '1997-03-14', 18, '4290150603', '4590120603', 'Masculino', 'aron58@hotmail.com', 'Calle Salazar#78', '35460', 'Guanajuato', 'Cueramaro', 'hernamdezaron', 'gonher098'),
('Rosa', 'Jimenez', 'Huerta', '1997-07-16', 18, '4290150506', '4590320708', 'Femenino', 'ros@hotmail.com', 'Calle Guadalupe#62', '24356', 'Guanajuato', 'Cueramaro', 'rosijimen', 'huertaros'),
('Francisco', 'Castañeda', 'Rosales', '1998-06-13', 22, '4290180506', '4880960506', 'Masculino', 'frnas@hotmail.com', 'Calle Guanajuato#58', '34560', 'Guanajuato', 'Irapuato', 'francast', 'castanedarosa'),
('Elia', 'Duarte', 'Morales', '1997-11-10', 18, '4290130305', '4590860203', 'Femenino', 'eli@hotmail.com', 'Calle Emily#56', '45579', 'Guanajuato', 'Cueramaro', 'elidurte', 'duartemora11'),
('Fabián', 'Castro', 'Herrera','1998-10-13', 17, '4290860705', '4620360809', 'Masculino', 'fabi@hotmail.com', 'Calle Kinto#58', '56589', 'Guanajuato', 'Cueramaro', 'fabiancastro', 'castrofab34'),
('Karen', 'Uribe', 'Garcia', '1998-12-14', 17, '4290150678', '4590320708', 'Femenino', 'anak@hotmail.com', 'Calle Mina#78', '25480', 'Guanajuato', 'Irapuato', 'kariurib', 'garciauri'),
('María', 'Meza', 'Rios', '1997-07-12', 18, '429756123', '429156230', 'Femenino', 'mari@hotmail.com', 'Calle Matamoros#45', '35580', 'Guanajuato', 'Abasolo', 'mezamari', 'mezamaria12'),
('Rihanna', 'Castro', 'Mendez', '1998-08-25', 17, '429812365', '429123365', 'Femenino', 'kard@gmail.com', 'Calle Roma#74', '57808', 'Guanajuato', 'Irapuato', 'rihancas', 'casstrorihan'),
('Daniel', 'Garcia', 'Vazquez', '1997-04-16', 18, '429785632', '429568137', 'Masculino.', 'daniel@hotmail.com', 'Calle Tijuana#78', '57899', 'Guanajuato', 'Cueramaro', 'danigarcia', 'garciavazquez'),
('Ana', 'Ledezma', 'Sanches', '1998-11-29', 17, '429785632', '429156321', 'Femenino.', 'an@hotmail.com', 'Calle Irapuato#45', '32677', 'Guanajuato', 'Cueramaro', 'anniledesma', 'sanchesanny'),
('Alexa', 'Contreras', 'Vargas', '1998-03-13', 17, '429451577', '429756123', 'Femenino', 'alecon@hotmail.com', 'Calle Potosina#40', '12345', 'Guanajuato', 'Irapuato', 'alexvargas', 'contrealexa'),
('Alan', 'Pacheco', 'Duarte', '1997-11-23', 18, '459126354', '4290180506', 'Masculino', 'alanpach@hotmail.com', 'Calle Miramor#89', '45870', 'Guanajuato', 'Irapuato', 'pachecoalan', 'duartepachaco18'),
('Pablo', 'Gallo', 'Moreno', '1997-02-23', 18, '4290180506', '4290150603', 'Masculino', 'gall_hhe@hotmail.com', 'Calle Mina#56','16689',  'Guanajuato', 'Abasolo', 'gallomoren', 'pablomoreno096'),
('Margarita', 'Bravo', 'Mendeza', '1998-05-27', 17, '429756123', '429451577', 'Femenino', 'mar_br@hotmail.com', 'Calle Hortelas#23', '65990', 'Guanajuato', 'Abasolo', 'margaritabra', 'bravomend85'),
('Gissel', 'Diaz', 'Ramirez', '1997-03-17', 18, '429451577', '429756123', 'Femenino', 'gisseldia_@hotmail.com', 'Calle Kino#78', '64786', 'Guanajuato', 'Abasolo', 'diazgissel', 'ramirezdiaz45'),
('Juan', 'Martinez', 'Ceballos', '1998-04-30', 17, '4290180506', '4290150603', 'Masculino', 'juan@hotmail.com', 'Calle Primavera#23', '76903', 'Guanajuato', 'Abasolo', 'martinezjuan', 'martinezceballos848'),
('Paola', 'Martinez', 'Guerra', '1998-05-17', 17, '4290150567', '4290150645', 'Femenino', 'paomarti@hotmail.com', 'Calle Juarez#80', '56680', 'Guanajuato', 'Irapuato', 'martinezpao', 'paoguerramar74'),
('Guadalupe', 'Fernandez', 'Garcia', '1997-06-28', 18, '429785632', '429123365', 'Femenino', 'lupefernamdez@hotmail.com', 'Calle Juarez#80', '39600', 'Guanajuato', 'Cueramaro', 'lupitagarcia', 'lupisferna850')
GO

-- REGISTROS DE LA TABLA RESPUESTAS:
INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 25, 'Existen 88 constelaciones', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 44, 'Andrómeda, Aquila, Ara, Argo Navis, Auriga', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 261, 'La diferencia es enorme, una galaxia es una agrupación de miles de millones de estrellas y gigantescas nubes de gas y polvo, una constelación no es más que una agrupación de estrellas que vistas desde la tierra se les puede asiganar forma gracias a los humanos', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 73, 'No, el sol no forma parte de alguna constelación al menos no en la tierra', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 137, 'Son agrupaciones de estrellas que se unen mediante trazos imaginarios y forman una silueta que adquiere figuras singulares y reconocibles', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 128, 'El sistema solar externo está formado por los 4 planetas gigantes: Júpiter, Saturno, Urano y Neptuno, y sus casi 200 satélites', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 197, 'Es el cuarto planeta en orden de colocación en el Sistema Solar, y el segundo más pequeño. Está situado al borde del “cinturón” de asteroides, en la parte interior, y es vecino de nuestro planeta', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 211, 'Los científicos astrónomos calculan que sólo en la Vía Láctea (nuestra galaxia), hay 300 mil millones de estrellas, y que en el universo total, podría haber, tantas galaxias, como estrellas hay en la Vía Láctea', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 300, 'El Sol, en su proceso vital, se encuentra ahora en lo que los astrónomos llaman “la secuencia principal”, la cual, en palabras más comprensibles, puede ser llamada también, etapa de “vida útil”, según los modelos usados en la astronomía, todavía brillará establemente otros 5 mil millones de años', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 37, 'Alexey  Leovonov  18 de Marzo de 1965', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 44, 'Cuentan con una bolsa de 1.9 litros de agua', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 70, 'La penda cuenta con un sistema de recolección de orina y haces facales', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 121, 'Los trajes espaciales poseen 91.5  metros de pequeñas tuberías por donde circula agua con el fin de refrigerar el cuerpo', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 10, 'En cohetes', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 38, 'Para los científicos especializados no', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 25, '1 año, 1 mes, y 2 semanas', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 28, '3 días, 3 horas, 49 minutos', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 115, 'Son espacios suspendidos en el espacio  que reciben ondas de radiocomunicación y las reflejan de nuevo a la tierra', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 46, 'Genímedes es el satélite más grande de Júpiter', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 9, 'Andrastea', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 68, 'Por sus ¨alas¨ que son paneles que transforman la luz en combustible', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 143, 'Los de comunicaciones que son los geoestacionarios (GEO), los que reflejan la señal  llamados pasivos y los que la amplifican llamados activos', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 77, 'Mercurio, Venus, la Tierra, Marte, Júpiter, Saturno, Urano, Neptuno y Plutón', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 8, 'Mercurio', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 20, 'Todo cuerpo celeste', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 94, 'A esos planetas se les conoce como exoplanetas, pueden encontrarse alrededor de las estrellas', 1)

INSERT INTO respuestas2(tipo, longitud, respuesta, id_usuario)
VALUES('CORRECTA', 40, 'No, la luz que vemos la reflejan del Sol', 1)
GO

-- REGISTROS DE LA TABLA PREGUNTAS:
INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 26, 'opcion multiple', '¿Cuantas constelaciones hay?', 'Medio', 9,9,9,9,9,9,9,9)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 33, 'opcion multiple', '¿Cuales son algunas constelaciones?', 'Medio', 1,1,1,1,1,1,1,1)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 55, 'opcion multiple', '¿Que diferencia hay entre una galaxia y una constelación?', 'Medio', 2,2,2,2,2,2,2,2)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 41, 'opcion multiple', '¿El sol forma parte de alguna constelación?', 'Medio', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 23, 'opcion multiple', '¿Que es una constelación?', 'Bajo', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 44, 'opcion multiple', '¿Que se entiende por el sistema solar interno?', 'Medio', 5,5,5,5,5,5,5,5)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 39, 'opcion multiple', '¿Que nos dirías acerca del planeta Marte?', 'Bajo', 6,6,6,6,6,6,6,6)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 30, 'opcion multiple', '¿Cuantos tipos de estrellas hay?', 'Bajo', 7,7,7,7,7,7,7,7)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('observatorios', 38, 'opcion multiple', '¿Hasta cuando va a durar estable el sol?', 'Meio', 8,8,8,8,8,8,8,8)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 51, 'opcion multiple', '¿Primer ser humana que realiza una caminata espacial?', 'Medio', 1,1,1,1,1,1,1,1)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 45, 'opcion multiple', '¿Con que cuentan los trajes de los astronautas?', 'Medio', 2,2,2,2,2,2,2,2)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 101, 'opcion multiple', '¿Cómo hacen del baño los astronautas durante las caminatas espaciales, si no se pueden quitar el traje?', 'Medio', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('astronautas', 38, 'opcion multiple', '¿Refrigeración de los trajes espaciales?', 'Medio', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 25, 'opcion multiple', '¿En que se puede viajar?', 'Bajo', 6,6,6,6,6,6,6,6)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 17, 'opcion multiple', '¿Tiene algún costo?', 'Bajo', 7,7,7,7,7,7,7,7)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 31, 'opcion multiple', '¿Cuanto tiempo tarda ese viaje?', 'Bajo', 8,8,8,8,8,8,8,8)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('LOS viajes', 47, 'opcion multiple', '¿Cuales son las misiones tripuladas más rápidas?', 'Medio', 9,9,9,9,9,9,9,9)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 23, 'opcion multiple', '¿Que son los satélites?', 'Bajo', 1,1,1,1,1,1,1,1)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 63, 'opcion multiple', '¿Cual es el satélite más grande que existe en el sistema solar?`', 'Medio', 2,2,2,2,2,2,2,2)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 60, 'opcion multiple', '¿Cual es el satélite más pequeño existe en el sistema solar?', 'Medio', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 26, 'opcion multiple', '¿Como funciona un satélite?', 'Medio', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los satelites', 18, 'opcion multiple', '¿Tipos de satélites?', 'Medio', 5,5,5,5,5,5,5,5)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los planetas', 45, 'Opción Multiple', '¿Cuáles son los 9 planetas del sistema solar?', 'Bajo',1,1,1,1,1,1,1,1)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('Los planetas', 39, 'Opción Multiple', '¿Cuál es el planeta más cercano al sol?', 'Medio',2,2,2,2,2,2,2,2)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('los planetas', 17, 'opcion multiple', '¿que es un planeta?', 'Bajo', 3,3,3,3,3,3,3,3)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('los planeta', 55, 'opcion multiple', '¿que sucede con los planetas que estan en otros sitios?', 'Medio', 4,4,4,4,4,4,4,4)

INSERT INTO preguntas2(tema, longitud, tipo, pregunta, grado_dificultad, id_respuesta, id_planeta, id_satelite, id_viaje, id_constelacion, id_observatorio, id_astronauta, id_transporte)
VALUES('los planeta', 32, 'opcion multiple', '¿Tienen luz propia los planetas?', 'Medio', 5,5,5,5,5,5,5,5)
GO


-- REGISTROS DE LA TABLA EVALUACIONES (1 registro)
INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Satelites Naturales', 10,'2000-10-02 01:15:13', 1, 1, 1)
GO
-- VARIOS REGISTROS
INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Constelaciones',10, '2000-10-02 00:15:13', 2, 2, 2)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronautas', 9,'2000-10-02 0:55:10', 3, 3, 3)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Planetas', 9,'1999-10-04 01:23:14', 4, 4, 4)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Asteroides', 9,'2007-03-10 02:33:54', 5, 5, 5)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Estrellas', 9,'2007-03-10 02:33:54',6, 6, 6)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Naves',9,'2007-03-10 02:33:54', 7, 7, 7)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Satelites', 9,'2007-03-10 02:33:54', 8, 8, 8)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Satelites naturales', 9,'2007-03-10 02:33:54',9, 9, 9 )

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronautas', 9,'2007-03-10 02:33:54', 10, 10, 10)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Hoyos negros', 9,'2007-03-10 02:33:54', 11, 11, 11)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Sistemas', 9,'2011-07-12 00:34:24', 12, 12, 12 )

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Rocas', 9,'2007-03-10 02:33:54', 13, 13, 13)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Sinturones', 10,'2007-03-10 02:33:54', 14, 14, 14)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Estrellas fugases', 10,'2007-03-10 02:33:54', 15, 15, 15)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronaves', 10,'1999-04-12 00:34:34',16, 16, 16)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cometas',10, '2006-06-09 00:47:28', 17, 17, 17 )

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Galaxias', 10,'2007-03-10 02:33:54', 18, 18, 18)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cuásares', 4,'2007-03-10 02:33:54',19, 19, 19)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulo globular', 4,'2007-03-10 02:33:54', 20, 20, 20)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Nebulosas brillantes', 4,'2007-03-10 02:33:54', 21, 21, 21)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulos abiertos', 6,'2007-03-10 02:33:54', 22, 22, 22)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Nebulosas', 6,'2007-03-10 02:33:54', 23, 23, 23)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Nebulosas oscuras', 6,'2007-03-10 02:33:54', 24, 24, 24)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulos de estrellas', 6,'2007-03-10 02:33:54',25, 25, 25)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Cúmulos de estrellas', 5,'2010-04-04 01:33:00', 26, 26, 26)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Galaxias', 3,'2010-05-11 02:20:38', 27, 27, 27)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Asteroides', 2,'2007-03-10 02:33:54', 28, 27, 27)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Astronautas', 1,'2007-03-10 02:33:54', 29, 27, 27)

INSERT INTO evaluaciones2(tema, puntuacion, fecha_duracion, id_usuario, id_pregunta, id_respuesta)
VALUES('Estrellas', 8,'2010-03-01 01:23:43', 30, 27, 27)
GO

-- REGISTROS DE LA TABLA ESCUELAS (1 registro)
INSERT INTO escuelas2(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web, id_usuario)
VALUES('José Maria Morelos', 'Publica', 'Basico', 'Hector Hernández Robles', 'Colonia Pedregal Calle Los Arcos #741', '1234567890', 'jmariamorelos@hotmail.com', 'www.josemariamoles.gob.mx', 1)
GO

-- VARIOS REGISTROS
INSERT INTO escuelas2(nombre, tipo, nivel_escolar, director, ubicacion, telefono, correo, pagina_web, id_usuario)
VALUES('Benito Juarez', 'Publica', 'Basico', 'Javier Camarillo Duarte', 'Estacion Joaquin', '4291139023', 'benijua@hotmail,com', 'www,benitojuarez.gob.mx', 2),

('Justo Sierra', 'Publica', 'Basico', 'Luis Martinez Luna', 'Estacion Joaquin', '4291236453', 'justsie@hotmail.com', 'www,justosier.gob.mx', 3),
('Nicolas Bravo', 'Publica', 'Basico', 'Sonia Ramirez Beltran', 'Calle Bolaños#45', '4299364574', 'nicobrav@hotamail.com', 'www,nicolasbrav.gob.mx', 4),
('Emiliano Zapata', 'Publica', 'Basico', 'Ramon Vargas Noriega', 'Calle 20Sep#70', '4625437634', 'emilizap@hotmail.com', 'www.emilizap.gob.mx', 5),
('Josefa Ortiz De Dominguez', 'Publica', 'Basico', 'Maria Leon Cervantes', 'Calle Degollado#45', '4299074567', 'joseort@hotmail.com', 'www.joseort.gob.mx', 6),
('Heroes De Chapultepec', 'Publica', 'Basico', 'Jose Martinez Ceballos', 'Calle Alba#12', '4621345564', 'heroeschap@hotmail.com', 'www.heroeschapul.gob.mx',7),
('Ignacio Allende', 'Publica', 'Basico', 'Fernando Ramirez HUerta', 'Calle Mina#78', '4293456789', 'ignacioalle@hotmail.com', 'www.ignacioalle.gob.mx',8),
('Juan Escutia', 'Publica', 'Baasico', 'Rosa Contreras Mendez', 'Calle Degollado#48', '4291234567', 'juanescut@hotmail.com', 'www.juanescutia.gob.mx',9),
('Carmen Ramos Del Rio', 'Publica', 'Basico', 'David Morales Juarez', 'Calle Valle#26', '4292357890', 'carmenram@hotmail.com', 'www.carmenramos.gob.mx',10),
('Francisco I Madero', 'Publica', 'Basico', 'Manuel Cervantes Rios', 'Calle Bolaños#49', '4629074567', 'francismad@hotmail.com', 'www.franciscomader.gob.mx',1),
('20 de Noviembre', 'Publica', 'Basico', 'Diana Luna Ponce', 'Calle Salazar#72', '429564237', '20nov@hotmail.com', 'www.20noviem.gob.mx',12),
('18 de Marzo', 'Publica', 'Basico', 'Raul Mendez Rojas', 'Calle Alba#19', '4292094523', '18marz@hotmail.com', 'www.1marzo.gob.mx',13),
('Las Naciones Unidas', 'Publica', 'Basico', 'Natalia Aguirre Galvan', 'Calle 20Sep#78', '4298756356', 'naciuni@hotmail.com', 'nacionunid.gob.mx',14),
('Lazaro Cardenas', 'Publica', 'Basico', 'Juan Zavala Rios', 'Calle Valle#25', '429123456', 'lazcard@hotmail.com', 'www.lazcarde.gob.mx',15),
('Benisario Dominguez', 'Publica', 'Basico', 'Dana Elizarraraz Noriega', 'Calle Guadalupe#62', '4621876530', 'benidom@hotmail.com', 'benisadomin.gob.mx',16),
('Cuahutemoc', 'Publica', 'Basico', 'Alan Rocha Gonzalez', 'Calle Guadalupe#55', '462965643', 'cuahu@hotmail.com', 'www.cuahutemoc.gob.mx',17),
('Miguel Hidalgo', 'Publica', 'Basico', 'Teresa Martinez Bravo', 'Calle Salazar#78', '4297654439', 'miguehidal@hotmail.com', 'www.miguelhidal.gob.mx',18),
('Morelos I Pavon', 'Publica', 'Basico', 'Elena Gonzalez Balandran', 'Calle Bolaños#23', '429145679', 'morelpav@hotmail.com', 'www.morelosipav.gob.mx',19),
('Benustiano Carranza', 'Publica', 'Basico', 'Susana Elizarraraz Rosales', 'Calle Matamoros#45', '42931256709', 'benustcarran@hotmail.com', 'www.benustianocarranza.gob.mx',20),
('Benito Juarez', 'Publica', 'Basico', 'Rubi Ramirez Guerra', 'Calle Roma#74', '4620985674','benitojuarez@hotmail.com', 'www.benitojuarez.gob.mx',21),
('Ignacio Allende', 'Publica', 'Basico', 'Carla rodriguez Gonzalez', 'Calle Morelos#34', '4291003608', 'ignallen@hotmail.com', 'www.ignacioallende.gob.mx',22),
('Carlos Cortes', 'Publica', 'Basico', 'Elizabeth Ramirez Hernandez', 'Calle Mina#78', '4621456709', 'carlocort@hotmsil.com', 'www.crloscortes.gob.mx',23),
('Macrina', 'Publica', 'Basico', 'Liliana Gonzalez Nuñez', 'Calle Troya#48', '429456723', 'macrina@hotmail.com', 'www.macrina,gob.mx',24),
('Miguel Hidalgo', 'Publica', 'Basico', 'Elia Guerrero Noriega', 'Calle Italia#40', '4291023465', 'miguelhidal@hotmail.com', 'www.miguelhidalgo.gob.mx',25),
('Guadalupe Victoria', 'Publica', 'Basico', 'Fabian Alcantar Guerrero', 'Calle Matamoros#49', '4624539078', 'guadalupvic@hotmail.com', 'www.guadalupevictori.gob.mx',26),
('Pancho Villa', 'Publica', 'Basico', 'Leonor Guerra Rojas', 'Calle Italia#45', '4291236798', 'panchov@hotmail.com', 'www.panchovilla.gob.mx',27),
('Sor Juana Ines De La Cruz', 'Publica', 'Basico', 'Gerardo Banda Soza', 'Calle Troya#47', '4623456789', 'sorjuain@hotmail.com', 'www.sorjuanainesdelacruz.gob.mx',28)
Go

----------------------------------<<<<<<<<<<<<<--CONSULTAS DEL EQUIPO>>>>>>>>>>>>>>>>>>>>>>--------------------------------

--CONSULTAS DE ARIANA GUADALUPE ELIZARRARAZ BANDA
-- Consultas sencillas
SELECT * FROM observatorios
WHERE pais = 'Estados Unidos'
AND tamano = 'Mediano'
OR tamano = 'Pequeño'
GO
SELECT * FROM usuarios
WHERE apellido_p = 'Martinez' OR apellido_p = 'Hernandez'
AND edad = 17 
GO
--Consultas de Resumen
SELECT Pais as [Pais], COUNT(id_observatorio) AS[Observatorios Medianos] 
FROM observatorios
GROUP by tamano, pais
Having tamano = 'Mediano' AND pais = 'Estados Unidos' OR pais = 'Francia'
GO

SELECT apellido_m as [apellido MATERNO], COUNT(id_usuario) AS[Usuarios de sexo FEMENINO cuyo apellido materno es GONZALEZ O RAMIREZ] 
FROM usuarios
GROUP by apellido_m, sexo
Having apellido_m = 'Ramirez' OR apellido_m = 'Gonzalez' AND sexo = 'Femenino'
GO

--Consultas Referencias Cruzadas


--Consultas DELETE
DELETE FROM Observatorios
WHERE pais = 'Estados Unidos' AND tamano = 'Mediano'
GO

DELETE FROM usuarios
WHERE edad = 18 OR sexo = 'Masculino'
GO

--Consultas Update
UPDATE	usuarios set domicilio = 'Calle Primavera#23' 
WHERE domicilio = 'Calle Mina#56' AND domicilio = 'Calle Mina#78'
GO

UPDATE usuarios set apellido_p = 'Martinez'
WHERE apellido_p = 'Contreras' OR apellido_p = 'Castro'
GO

--Consultas UNION
SELECT * FROM observatorios 
WHERE pais = 'España' AND tamano = 'Mediano'
UNION all
SELECT * FROM observatorios2
ORDER BY pais DESC 
GO

SELECT * FROM usuarios
WHERE edad = 17 OR apellido_m = 'Gonzalez'
UNION all
SELECT * FROM usuarios2
ORDER BY nombre DESC
GO

--Consultas INNER JOIN
SELECT*
FROM observatorios INNER JOIN constelaciones ON (observatorios.id_constelacion = constelaciones. id_constelacion)
AND (observatorios.id_constelacion = constelaciones. id_constelacion)

---------------------------------- TERMINARON CONSULTAS DE ARIANA --------------------------------------------------


-- CONSULTAS JOSÉ LUIS CASTRO DELGADO
-- Consulta sencilla CONSTELACIONES
-- 1 Condición
SELECT * FROM CONSTELACIONES WHERE nombre_en_latin = 'Leo' 
GO
-- 3 Condiciones
SELECT * FROM CONSTELACIONES WHERE (elemento = 'Tierra' AND domicilio = 'Marte') OR nombre_en_latin = 'Taurus'
GO

-- Consulta de RESUMEN constelaciones
-- Consultas de 1 condición
SELECT elemento  AS [Elemento], COUNT(id_constelacion) AS [Elementos de las constelaciones]
FROM CONSTELACIONES
GROUP BY elemento
Having elemento = 'Fuego'
GO

-- Consultas de 2 Condiciones
SELECT nombre_en_espanol as [Nombre de las constelaciones], COUNT(id_constelacion) AS [Veces que se repite]
FROM constelaciones
GROUP by nombre_en_espanol, nombre_en_latin
Having nombre_en_espanol = 'Cancer el cangrejo' AND nombre_en_latin = 'Cancer'
GO

-- Consultas Referencias Cruzadas constelaciones
WITH CONSULTAA as
(
SELECT domicilio [DOMICILIO], 
elemento, 
id_constelacion
FROM constelaciones
)
SELECT * FROM CONSULTAA
PIVOT (count(id_constelacion) FOR elemento IN ([Tierra], [Aire], [Fuego])) P

-- consulta de union constelaciones
--consulta union 1 condicion
SELECT * from constelaciones
WHERE nombre_en_latin = 'Taurus'
UNION ALL
SELECT * from constelaciones2
WHERE nombre_en_latin = 'Taurus'
go

--consulta union 2 condicion
SELECT * from constelaciones
WHERE nombre_en_latin = 'Gemini' and nombre_en_espanol = 'Geminis los gemelos'
UNION ALL
SELECT * from constelaciones2
WHERE nombre_en_latin = 'Gemini' and nombre_en_espanol = 'Geminis los gemelos'
go

--consulta de ELIMINACIÓN 1 condicion
DELETE 
FROM constelaciones
WHERE (domicilio = 'Marte');
go
--consulta de ELIMINACIÓN 2 condiciones
DELETE 
FROM constelaciones
WHERE (domicilio = 'Mercurio' and nombre_en_latin = 'Gemini');
go

--CONSULTAS DE ACTUALIZACIÓN 1 condicion
UPDATE constelaciones SET elemento = 'Agua'
WHERE elemento = 'Tierra';
go

--CONSULTAS DE ACTUALIZACIÓN 2 condiciones
UPDATE constelaciones SET domicilio = 'Tierra'
WHERE domicilio = 'Sol' AND elemento = 'Fuego';
go

--CONSULTAS DE INNER JOIN
SELECT *
FROM constelaciones INNER JOIN constelaciones2 ON constelaciones.domicilio = constelaciones2.domicilio;
go
 -- Consulta sencilla evaluaciones
-- 1 Condición
SELECT * FROM evaluaciones WHERE puntuacion > 5 
GO

-- 2 Condiciones
SELECT * FROM evaluaciones WHERE (tema = 'Satelites') OR puntuacion = 9
GO

-- Consulta de RESUMEN evaluaciones
-- Consultas de 1 condición
SELECT puntuacion  AS [puntuacion], COUNT(id_evaluacion) AS [numero con la puntuacion igual]
FROM evaluaciones
GROUP BY puntuacion
Having puntuacion = 9
GO

-- Consultas de 2 Condiciones
SELECT puntuacion as [Numero de puntuacion], COUNT(id_evaluacion) AS [Veces que se repite]
FROM evaluaciones
GROUP by puntuacion, fecha_duracion, tema
Having puntuacion = 10 AND tema = 'Constelaciones'
GO

-- Consultas Referencias Cruzadas evaluaciones
WITH CONSULTA as
(
SELECT puntuacion [Puntuacion], 
fecha_duracion, 
id_evaluacion
FROM evaluaciones
)
SELECT * FROM CONSULTA
PIVOT (count(id_evaluacion) FOR fecha_duracion IN  ([2007-03-10 02:33:54], [2011-07-12 00:34:24], [1999-04-12 00:34:34])) P

--CONSULTA UNION
--CONSULTA UNION 1 CONDICION
SELECT * from evaluaciones
WHERE puntuacion = 10
UNION ALL
SELECT * from evaluaciones2
WHERE puntuacion = 10

-- CONSULTA UNION 2 CONDICION
SELECT * from evaluaciones
WHERE puntuacion = 9 and tema = 'Sistemas'
UNION ALL
SELECT * from evaluaciones2
WHERE puntuacion = 9 and  tema = 'Sistemas'
go
--consulta eliminacion
DELETE 
FROM evaluaciones
WHERE (puntuacion = 9)

--consulta eliminacion 2 condiciones
DELETE
FROM evaluaciones
WHERE (puntuacion = 10) OR (tema = 'Satelites Naturales');
go

--consulta actualizacion 1 condicion 
UPDATE evaluaciones SET puntuacion = 9
WHERE puntuacion = 10;
go
----consulta actualizacion 2 condiciones
UPDATE evaluaciones SET puntuacion = 10
WHERE puntuacion = 9 AND  tema = 'Constelaciones';
go

--consulta INNER JOIN
SELECT *
FROM evaluaciones INNER JOIN constelaciones2 ON evaluaciones.tema = tema;
go

---------------------------------- TERMINARON CONSULTAS DE José Luis Castro --------------------------------------------------


-- CONSULTAS ANDREA GISSEL PALACIOS DÍAZ
-- CONSULTAS DE ASTRONAUTAS
-- CONSULTA SENCILLA
SELECT * FROM ASTRONAUTAS WHERE edad < 50 AND estatura < 1.80
GO
SELECT * FROM ASTRONAUTAS WHERE nombre = 'Alan Castillo' AND correo = 'Alan_Ortuga@outlook.com' OR estatura = '1.68'
GO 

--CONSULTA DE RESUMEN 
SELECT edad  AS [Edad], COUNT(id_astronauta) AS [Edades de los Astronautas]
FROM ASTRONAUTAS 
GROUP BY edad
Having edad = 40
GO

--CONSULTA DE ELIMINAR 
DELETE FROM ASTRONAUTAS 
WHERE nombre = 'Javier Vaca' AND edad = '43'
GO
DELETE FROM ASTRONAUTAS  
WHERE nombre = 'Alonso Baker' AND edad = '33' OR estatura = '1.84'
GO

--CONSULTA DE ACTUALIZAR 
UPDATE astronautas SET nombre = 'Angelito'
WHERE nombre = 'Carlos Del Rio' AND edad = '54' 
GO 
UPDATE astronautas set nombre = 'Angelito2'
WHERE nombre = 'Rene Zarate' AND edad = '20' OR telefono = '4702756442'
GO 

--CONSULTAS DE UNION 
SELECT * FROM astronautas 
UNION all
SELECT *  FROM astronautas
GO 

--CONSULTA DE REFERENCIAS CRUZADAS 
WITH CONSULTAA as
(
SELECT estatura [ESTATURA], 
edad, 
id_astronauta 
FROM astronautas
)
SELECT * FROM CONSULTAA
PIVOT (count(id_astronauta) FOR edad IN ([40], [45], [50])) PTV

--CONSULTA DE INNER JOIN 
SELECT * 
FROM astronautas INNER JOIN escuelas ON astronautas edad = edad;
GO
 
-- CONSULTAS DE ESCUELAS
--Consulta sencilla
SELECT * FROM escuelas WHERE nombre = 'Justino Sierra' OR tipo = 'Publica' 
GO
SELECT * FROM escuelas WHERE nombre = 'Justino Sierra' AND tipo = 'Publica' OR nivel_escolar = 'Basico'
GO 

--CONSULTA DE RESUMEN 
SELECT nombre AS [nivel_escolar], COUNT(director) AS [id_usuario]
FROM ESCUELAS 
GROUP BY nombre
Having nombre = 'Benito Juarez' 
GO

--CONSULTA DE ELIMINAR 
DELETE FROM ESCUELAS  
WHERE nombre = 'Francisco I Madero' AND tipo = 'Publica'
GO
DELETE FROM ESCUELAS   
WHERE nombre = 'Lazaro Cardenas' AND tipo = 'Publica' OR nivel_escolar = 'Basico'
GO

--CONSULTA DE ACTUALIZAR
UPDATE escuelas set tipo = 'Privada'
WHERE nombre = 'Eta' AND tipo = 'Especial' 
GO 
UPDATE escuelas set tipo = 'Privada'
WHERE nombre = 'Niños Heroes' AND tipo = 'Especial' OR telefono = '4702742842'
GO 
--CONSULTAS DE UNION 
SELECT * FROM ESCUELAS  
UNION all 
SELECT * FROM ESCUELAS2 
GO 

--CONSULTA DE REFERENCIAS CRUZADAS 
WITH CONSULTAA as
(
SELECT nivel_escolar [NIVEL_ESCOLAR], 
nombre, 
tipo
FROM escuelas 
)
SELECT * FROM CONSULTAA
PIVOT (count(nombre) FOR tipo IN ([40], [45], [50])) PTV

--CONSULTA DE INNER JOIN 
SELECT * 
FROM escuelas INNER JOIN astronautas ON escuelas ubicacion = ubicacion;
GO

---------------------------------- TERMINARON CONSULTAS DE ANDREA --------------------------------------------------


-- CONSULTAS PAULA EDITH ROCHA BRAVO
--SENCILLAS
SELECT * FROM SATELITES
GO

SELECT * FROM SATELITES
WHERE Saturno AND Grande
GO

SELECT * FROM SATELITES
WHERE 8.706d OR Natural
GO

--RESUMEN
SELECT diametro  AS [Diametro], COUNT(periodo_orbital) AS [Periodo Orbital]
FROM satelites
GROUP BY diametro
Having diametro = 1062
GO
SELECT tamano as [Tamaño del satelite], COUNT(nombre) AS [Veces que se repite]
FROM satelites
GROUP by tamano, satelite
Having satelite = 'Calisto' AND tamano = 'Grande'
GO
--ELIMINAR
DELETE FROM satelites
WHERE nombre = 'Dione' AND diametro '1118'
WHERE ubicacion = 'Saturno' OR tamano 'Grande'
GO
--ACTUALIZAR
UPDATE satelites SET nombre = 'Europa'
WHERE nombre = 'Luna'
GO
--UNION
SELECT 
FROM satelites
union all select
FROM satelites
GO

---------------------------------- TERMINARON CONSULTAS DE PAULA --------------------------------------------------


-- CONSULTAS JOSÉ LUIS MARTÍNEZ CASTAÑEDA
-- SELECCIÓN
SELECT * FROM evaluaciones WHERE tema = 'Asteroides' AND puntuacion = '9'
GO
SELECT * FROM medios_transporte WHERE tamano = 'Chico' OR tamano = 'Grande'
GO

-- RESUMEN
SELECT tamano as [Tamaño], COUNT(id_transporte) AS [Veces que se repite]
FROM medios_transporte
GROUP by tamano
Having tamano = 'Chico'
GO

SELECT tamano as [Tamaño del Observatorio], COUNT(id_observatorio) AS [Veces que se repite]
FROM observatorios
GROUP by tamano, pais
Having pais = 'Estados Unidos' AND tamano = 'Mediano'
GO

-- REFERENCIAS CRUZADAS
WITH CONSULAR as
(
SELECT destino [-- DESTINO --],
lugar_salida,
id_viaje
FROM viajes
)
SELECT * FROM CONSULAR
PIVOT (count(id_viaje) FOR lugar_salida IN ([CANADA], [ESTADOS UNIDOS], [SUECIA])) PTV

WITH CONSULAR as
(
SELECT edad [-- EDAD --],
sexo,
id_usuario
FROM usuarios
)
SELECT * FROM CONSULAR
PIVOT (count(id_usuario) FOR sexo IN ([FEMENINO], [MASCULINO])) PTV

-- ELIMINACIÓN
DELETE FROM usuarios WHERE edad = 17 AND telefono_celular  = '4621264251'
GO
DELETE FROM usuarios WHERE edad = 17 OR sexo = 'Femenino'
GO
-- ACTUALIZACIÓN
UPDATE usuarios set edad = 19 WHERE edad = 16 AND sexo = 'Msculino'
GO
UPDATE usuarios set edad = 90 WHERE edad = 18 OR telefono_celular = '4290150506'
GO
--UNIÓN
SELECT * FROM usuarios WHERE id_usuario = 15 AND nombre = 'Francisco'
UNION ALL 
SELECT * FROM usuarios2
GO

SELECT * FROM usuarios WHERE id_usuario = 10 OR sexo = 'Femenino'
UNION ALL 
SELECT * FROM usuarios2
GO
-- INNER JOIN
SELECT * FROM escuelas INNER JOIN usuarios ON escuelas.id_usuario = usuarios.id_usuario
GO

------------------------------- TERMINAN CONSULTAS JOSÉ LUIS MARTÍNEZ --------------------------------------------------