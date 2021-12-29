-- Mostrar CADA UNA DE LAS Tablas
USE estetik
GO

SELECT name AS [NOMBRE DE LA TABLA] FROM sysobjects WHERE type='U'
GO