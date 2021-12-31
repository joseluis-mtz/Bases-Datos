-- CONSULTAS DE SELECCIÓN 
-- 1 Condición
SELECT * FROM astronautas WHERE edad < 35
GO

SELECT * FROM constelaciones WHERE domicilio = 'Marte'
GO

SELECT top(5) * FROM escuelas WHERE ubicacion = 'Estacion Joaquin'
GO

-- 2 Condiciones
SELECT * FROM evaluaciones WHERE tema = 'Asteroides' AND puntuacion = '9'
GO

SELECT * FROM medios_transporte WHERE tamano = 'Chico' OR tamano = 'Grande'
GO

SELECT * FROM observatorios WHERE pais = 'Mexico' OR pais = 'Canada'
GO

-- 3 Condiciones
SELECT * FROM planetas WHERE (diametro_ecuatorial < 1 AND masa <= 1) OR nombre = 'Tierra'
GO

SELECT * FROM usuarios WHERE sexo = 'Femenino' AND edad = 16 OR telefono_casa = ''
GO

SELECT * FROM viajes WHERE lugar_salida = 'Canada' OR lugar_salida = 'Suecia' AND numero_integrantes < 10
GO

-- 1 Condición
SELECT * FROM satelites WHERE nombre = 'Luna'
GO

-- CONSULTAS DE RESUMEN

-- Consultas de 1 condición
SELECT edad  AS [Edad], COUNT(id_astronauta) AS [Edades de los Astronautas]
FROM astronautas
GROUP BY edad
Having edad = 40
GO


SELECT elemento as [Elemento], COUNT(id_constelacion) AS [Veces que se repite]
FROM constelaciones
GROUP by elemento
Having elemento = 'Agua'
GO


SELECT tipo as [Tipo de Escuela], COUNT(id_escuela) AS [Veces que se Repite]
FROM escuelas
GROUP by tipo
Having  tipo = 'Publica'
GO

SELECT tema as [Tema de la pregunta], COUNT(id_evaluacion) AS [Veces que se Repite]
FROM evaluaciones
GROUP by tema
Having  tema = 'Galaxias'
GO

SELECT tamano as [Tamaño], COUNT(id_transporte) AS [Veces que se repite]
FROM medios_transporte
GROUP by tamano
Having tamano = 'Chico'
GO
-- Consultas de 2 Condiciones

SELECT tamano as [Tamaño del Observatorio], COUNT(id_observatorio) AS [Veces que se repite]
FROM observatorios
GROUP by tamano, pais
Having pais = 'Estados Unidos' AND tamano = 'Mediano'
GO

SELECT nombre as [Nombre del Planeta], COUNT(id_planeta) AS [Veces que se repite]
FROM planetas
GROUP by nombre,diametro_ecuatorial, masa
Having diametro_ecuatorial <= 1 AND masa <= 1
GO

SELECT nombre as [NOMBRE], count(id_satelite) AS [Veces que se repite]
FROM satelites
GROUP by nombre, ubicacion, tamano
Having ubicacion = 'Jupiter' AND tamano = 'Mediano'
GO

SELECT edad as [EDAD], count(id_usuario) AS [VECES QUE SE REPITE]
FROM usuarios
GROUP by sexo, edad, codigo_postal
Having (sexo  = 'Femenino' AND edad <= 16)
GO

SELECT destino as [DESTINO DEL VIAJE], COUNT(id_viaje) AS [VECES QUE SE REPITE]
FROM viajes
GROUP by destino, numero_integrantes
Having destino = 'Luna' AND numero_integrantes =7
GO

-- CONSULTAS DE REFERENCIAS CRUZADAS

SELECT * FROM astronautas
SELECT edad AS [EDAD], [0], [1], [2], [3], [4]
FROM (
estatura, id_astronauta
FROM astronautas) AS [DATOS]
PIVOT 
(
count(id_astronauta)
FOR estatura IN ([0], [1], [2], [3], [4])
)
AS [Pora]