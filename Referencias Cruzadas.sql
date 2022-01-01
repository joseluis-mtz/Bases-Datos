select * from astronautas
go

WITH CONSULTAA as
(
SELECT estatura [ESTATURA], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
edad, -- Columnas
id_astronauta -- Agregación Elemento de intersección
FROM astronautas
)
SELECT * FROM CONSULTAA
PIVOT (count(id_astronauta) FOR edad IN ([40], [45], [50])) PTV
