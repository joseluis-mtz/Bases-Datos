-- REF. CRUZADAS 1 ASTRONAUTAS
WITH CONSULTAA as
(
SELECT estatura [ESTATURA], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
edad, -- Columnas
id_astronauta -- Agregaci�n Elemento de intersecci�n
FROM astronautas
)
SELECT * FROM CONSULTAA
PIVOT (count(id_astronauta) FOR edad IN ([40], [45], [50])) PTV

-- REF. CRUZADAS 2 CONSTELACIONES
WITH CONSUL as
(
SELECT nombre_en_latin [NOMBRE], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
elemento, -- Columnas
id_constelacion -- Agregaci�n Elemento de intersecci�n
FROM constelaciones
)
SELECT * FROM CONSUL
PIVOT (count(id_constelacion) FOR elemento IN ([Fuego], [Tierra], [Aire], [Agua])) PTV

-- REF. CRUZADAS 3 ESCUELAS
WITH CONSULA as
(
SELECT tipo [TIPO], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
nivel_escolar, -- Columnas
id_escuela -- Agregaci�n Elemento de intersecci�n
FROM escuelas
)
SELECT * FROM CONSULA
PIVOT (count(id_escuela) FOR nivel_escolar IN ([BASICO], [MEDIO SUPERIOR], [SUPERIOR])) PTV

-- REF. CRUZADAS 4 EVALUACIONES
WITH CONSULAR as
(
SELECT tema [TEMA  ---->  CALIFICACIONES], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
puntuacion, -- Columnas
id_evaluacion -- Agregaci�n Elemento de intersecci�n
FROM evaluaciones
)
SELECT * FROM CONSULAR
PIVOT (count(id_evaluacion) FOR puntuacion IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10])) PTV

-- REF. CRUZADAS 5 MEDIOS DE TRANSPORTE
WITH CONSULAR as
(
SELECT tamano [-- TAMA�O --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
capacidad_personas, -- Columnas
id_transporte -- Agregaci�n Elemento de intersecci�n
FROM medios_transporte
)
SELECT * FROM CONSULAR
PIVOT (count(id_transporte) FOR capacidad_personas IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10], [11],[12],[13],[14],[15],[16],[17],[18],[19], [20])) PTV

-- REF. CRUZADAS 6 OBSERVATORIOS
WITH CONSULAR as
(
SELECT pais [-- PA�S --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
tamano, -- Columnas
id_observatorio -- Agregaci�n Elemento de intersecci�n
FROM observatorios
)
SELECT * FROM CONSULAR
PIVOT (count(id_observatorio) FOR tamano IN ([CHICO], [MEDIANO], [GRANDE])) PTV

-- REF. CRUZADAS 7 PREGUNTAS
WITH CONSULAR as
(
SELECT tema [-- TEMA --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
grado_dificultad, -- Columnas
id_pregunta -- Agregaci�n Elemento de intersecci�n
FROM preguntas
)
SELECT * FROM CONSULAR
PIVOT (count(id_pregunta) FOR grado_dificultad IN ([Bajo], [Medio], [Alto])) PTV

-- REF. CRUZADAS 8 SATELITES
WITH CONSULAR as
(
SELECT nombre [-- NOMBRE --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
tamano, -- Columnas
id_satelite -- Agregaci�n Elemento de intersecci�n
FROM satelites
)
SELECT * FROM CONSULAR
PIVOT (count(id_satelite) FOR tamano IN ([CHICO], [MEDIANO], [GRANDE])) PTV

-- REF. CRUZADAS 9 USUARIOS
WITH CONSULAR as
(
SELECT edad [-- EDAD --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
sexo, -- Columnas
id_usuario -- Agregaci�n Elemento de intersecci�n
FROM usuarios
)
SELECT * FROM CONSULAR
PIVOT (count(id_usuario) FOR sexo IN ([FEMENINO], [MASCULINO])) PTV

-- REF. CRUZADAS 10 VIAJES
WITH CONSULAR as
(
SELECT destino [-- DESTINO --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
lugar_salida, -- Columnas
id_viaje -- Agregaci�n Elemento de intersecci�n
FROM viajes
)
SELECT * FROM CONSULAR
PIVOT (count(id_viaje) FOR lugar_salida IN ([CANADA], [ESTADOS UNIDOS], [SUECIA])) PTV

-- REF. CRUZADAS 11 PLANETAS
WITH CONSULAR as
(
SELECT diametro_ecuatorial [-- Diametro Ecuatorial --], -- Elemento de agrupamiento, lo que se quiere ver como filas en la tabla resultante
nombre, -- Columnas
id_planeta -- Agregaci�n Elemento de intersecci�n
FROM planetas
)
SELECT * FROM CONSULAR
PIVOT (count(id_planeta) FOR nombre IN ([Mercurio], [Venus], [Tierra], [Marte], [Jupiter], [Saturno], [Urano], [Neptuno], [Ceres], [Pluton], [Haumea])) PTV