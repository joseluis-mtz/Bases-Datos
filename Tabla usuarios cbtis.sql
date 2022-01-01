-- Crear la tabla 
CREATE TABLE usuarios(
id_usuario smallint NOT NULL PRIMARY KEY identity(1,1),
nombre varchar(20) NOT NULL,
apellido_p varchar(20) NOT NULL,
apellido_m varchar(20) NULL,
fecha_nacimiento date NOT NULL,
edad tinyint NOT NULL,
telefono_celular char(10) NULL,
telefono_casa char(10) NULL,
sexo varchar(20) NOT NULL,
correo varchar(35) NOT NULL unique,
domicilio varchar(250) NOT NULL,
codigo_postal char(5) NOT NULL,
estado varchar(25) NOT NULL,
ciudad varchar(25) NOT NULL,
nombre_usuario varchar(20) NOT NULL unique,
pass varchar(20) NOT NULL unique)
GO

-- REGISTROS DE LA TABLA USUARIOS (1 registro)
INSERT INTO usuarios(nombre, apellido_p, apellido_m, fecha_nacimiento, edad, telefono_celular, telefono_casa, sexo, correo, domicilio, codigo_postal, estado, ciudad, nombre_usuario, pass)
VALUES('Paula', 'Rocha', 'Bravo', '1998-09-13', 17, '4621264251', '', 'Femenino', 'paulaeditchrochabravo@hotmail.com', 'Andrés Balvaner# 4  Col. Centro', '12345', 'Guanajuato', 'Abasolo', 'paulab', '45pau')
GO