select * from astronautas
go

WITH CONSULTAA as
(
SELECT estatura [ESTATURA], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
edad, -- Columnas
id_astronauta -- Agregaci�n Elemento de intersecci�n
FROM astronautas
)
SELECT * FROM CONSULTAA
PIVOT (count(id_astronauta) FOR edad IN ([40], [45], [50])) PTV
