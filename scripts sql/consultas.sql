-- Universidad Técnica Particular de Loja
-- Ingeniería en Ciencias de la Computación
-- Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
-- Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
-- Estudiante: Denis Alexander Cuenca Buele | dacuenca7@utpl.edu.ec
-- Link del proyecto en Github: https://github.com/DenisCuenca/Proyecto_integrador.git
-- Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
-- Fecha: Loja, 8 de febrero del 2022

-- Ejemplos de explotación de datos:


-- Buscar los miembros de cast que son hombres:
SELECT movie_cast.name
FROM movie_cast
WHERE gender = 1;



-- Buscar las peliculas que fueron dirijidas por Steven Spielberg
SELECT *
FROM movie
WHERE director = "Steven Spielberg"



-- Buscar Cuantas peliculas ha dirijido ca da director
SELECT count(m.id) as "catidad", m.director as "director"
FROM movie m
group by director;



-- Buscar Cuantas peliculas por genero existen:
SELECT count(m.id) as "catidad", g.genre as "genero"
FROM movie m, movie_gender g
WHERE g.movie_id = m.id
group by gender;




-- Buscar las peliculas lanzadas en 2000:
SELECT m.*
FROM movie m
WHERE m.relase_date = "2000"



-- Buscar las peliculas con mayor recaudación por año
SELECT movie.title, MAX(m.revenue) max_revenue
FROM movie m
GROUP BY m.title
ORDER BY m.title;

