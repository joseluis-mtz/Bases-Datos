create database veterinaria

use veterinaria

create table trabajador
(id_trabajador int primary key  not null,
nombre varchar(30),
puesto varchar(30),
direccion varchar(30)
)

create table mascotas
(id_mascotas int primary key  not null,
nombre varchar(30),
raza varchar(30),
anios varchar(30),
sexo varchar(30),
)

create table proveedor
(id_proveedor int primary key  not null,
nombre varchar(30),
telefono varchar(30)
)

create table producto
(id_producto int primary key  not null,
nombre varchar(30),
cantidad int,
costo int,
id_proveedor int
)

-- Crear relaciones PRODUCTO PROVEEDOR
ALTER TABLE producto
ADD CONSTRAINT FK_PRODUCTO_PROVEEDOR
FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

create table duenios
(id_dueno int primary key not null,
nombre varchar(30),
direccion varchar (30),
id_mascotas int
)

-- Crear relaciones DUEÑOS MASCOTAS
ALTER TABLE duenios
ADD CONSTRAINT FK_DUENIOS_MASCOTAS
FOREIGN KEY (id_mascotas) REFERENCES mascotas(id_mascotas)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

create table consulta
(id_consulta int primary key  not null,
fecha varchar(30),
costo int,
id_trabajador int,
id_duenos int,
id_mascotas int,
id_producto int
)

-- Crear relaciones CONSULTA TRABAJADOR
ALTER TABLE consulta
ADD CONSTRAINT FK_CONSULTA_TRABAJADOR
FOREIGN KEY (id_trabajador) REFERENCES trabajador(id_trabajador)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Crear relaciones CONSULTA DUEÑOS
ALTER TABLE consulta
ADD CONSTRAINT FK_CONSULTA_DUEÑOS
FOREIGN KEY (id_duenos) REFERENCES duenios (id_dueno)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Crear relaciones CONSULTA MASCOTAS
ALTER TABLE consulta
ADD CONSTRAINT FK_CONSULTA_MASCOTAS
FOREIGN KEY (id_mascotas) REFERENCES mascotas (id_mascotas)
GO
-- Crear relaciones CONSULTA PRODUCTOS
ALTER TABLE consulta
ADD CONSTRAINT FK_CONSULTA_PRODUCTOS
FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

insert into proveedor (id_proveedor,nombre,telefono) values (1,'pedigree','40')
insert into proveedor (id_proveedor,nombre,telefono) values (2,'whiskas','69')
insert into proveedor (id_proveedor,nombre,telefono) values (3,'boty','35')
insert into proveedor (id_proveedor,nombre,telefono) values (4,'rodrigo','25')
insert into proveedor (id_proveedor,nombre,telefono) values (5,'pedro','90')

insert into trabajador (id_trabajador,nombre,puesto,direccion) values (1,'ivan','intendente','centro')
insert into trabajador (id_trabajador,nombre,puesto,direccion) values (2,'ulises','veterinario','centro')
insert into trabajador (id_trabajador,nombre,puesto,direccion) values (3,'jesus','vetrinario','centro')
insert into trabajador (id_trabajador,nombre,puesto,direccion) values (4,'uriel','recepcionista','centro')
insert into trabajador (id_trabajador,nombre,puesto,direccion) values (5,'maria','intendente','centro')

insert into mascotas (id_mascotas,nombre,raza,anios,sexo) values (1,'solovino','doverman','8','M')
insert into mascotas (id_mascotas,nombre,raza,anios,sexo) values (2,'labrador','doverman','7','F')
insert into mascotas (id_mascotas,nombre,raza,anios,sexo) values (3,'labrador','doverman','6','M')
insert into mascotas (id_mascotas,nombre,raza,anios,sexo) values (4,'poddle','doverman','4','F')
insert into mascotas (id_mascotas,nombre,raza,anios,sexo) values (5,'chihuahua','doverman','3','M')

insert into duenios (id_dueno, nombre, direccion, id_mascotas) values (1, 'Juan Perez', 'Degollado sur', 1)
insert into duenios (id_dueno, nombre, direccion, id_mascotas) values (2, 'Roberto Perez', 'Degollado sur', 1)
insert into duenios (id_dueno, nombre, direccion, id_mascotas) values (3, 'Luis Saldivar', 'Degollado sur', 1)
insert into duenios (id_dueno, nombre, direccion, id_mascotas) values (4, 'Mustafa Lopez', 'Degollado sur', 2)
insert into duenios (id_dueno, nombre, direccion, id_mascotas) values (5, 'Roman Iriarte', 'Degollado sur', 3)

insert into producto (id_producto,nombre,cantidad,costo,id_proveedor) values (1,'juguete',20,10,3)
insert into producto (id_producto,nombre,cantidad,costo,id_proveedor) values (2,'cama',10,50,4)
insert into producto (id_producto,nombre,cantidad,costo,id_proveedor) values (3,'comida',50,100,1)
insert into producto (id_producto,nombre,cantidad,costo,id_proveedor) values (4,'casa',30,50,2)
insert into producto (id_producto,nombre,cantidad,costo,id_proveedor) values (5,'zapatos',20,30,4)

insert into consulta (id_consulta,fecha,costo,id_trabajador,id_duenos,id_mascotas,id_producto) values (1,'20-12-2012',100,2,3,1,3)
insert into consulta (id_consulta,fecha,costo,id_trabajador,id_duenos,id_mascotas,id_producto) values (2,'20-12-2012',500,3,1,5,4)
insert into consulta (id_consulta,fecha,costo,id_trabajador,id_duenos,id_mascotas,id_producto) values (3,'25-12-2012',700,4,5,4,5)
insert into consulta (id_consulta,fecha,costo,id_trabajador,id_duenos,id_mascotas,id_producto) values (4,'02-12-2012',800,5,4,2,2)
insert into consulta (id_consulta,fecha,costo,id_trabajador,id_duenos,id_mascotas,id_producto) values (5,'30-12-2012',350,1,2,3,1)

select * from consulta

---------1--------
SELECT * FROM producto WHERE nombre = 'cama'
GO

---------2--------
SELECT * FROM producto WHERE cantidad = 20
GO

---------3--------
SELECT * FROM producto WHERE costo = 50
GO

---------4--------
SELECT * FROM producto WHERE id_proveedor = 4
GO

---------5--------
SELECT * FROM proveedor WHERE nombre = 'pulgas'
GO

---------6--------
DELETE FROM mascotas WHERE nombre = 'solovino'
GO
SELECT * FROM mascotas

---------7--------
DELETE FROM mascotas WHERE anios = 6
GO
SELECT * FROM mascotas

---------8--------
DELETE FROM mascotas WHERE nombre = 'poddle'
GO
SELECT * FROM mascotas

---------9--------
DELETE FROM mascotas WHERE id_mascotas > 4
GO
SELECT * FROM mascotas

---------10--------
DELETE FROM trabajador WHERE nombre = 'ulises'
GO
SELECT * FROM trabajador

---------11-------
UPDATE proveedor SET nombre = 'Pulgas' WHERE id_proveedor = 1
GO
SELECT * FROM proveedor

---------12--------
UPDATE proveedor SET nombre = 'SANSON' WHERE id_proveedor = 2
GO
SELECT * FROM proveedor

---------13--------
UPDATE proveedor SET nombre = 'RUFO' WHERE id_proveedor = 3
GO
SELECT * FROM proveedor

---------14--------
UPDATE proveedor SET nombre = 'SACO' WHERE id_proveedor = 4
GO
SELECT * FROM proveedor

---------15--------
UPDATE proveedor SET nombre = 'TALAS' WHERE id_proveedor = 5
GO
SELECT * FROM proveedor