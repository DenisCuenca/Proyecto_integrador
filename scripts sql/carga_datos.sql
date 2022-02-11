-- Universidad Técnica Particular de Loja
-- Ingeniería en Ciencias de la Computación
-- Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
-- Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
-- Estudiante: Denis Alexander Cuenca Buele | dacuenca7@utpl.edu.ec
-- Link del proyecto en Github: 
-- Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
-- Fecha: Loja, 8 de febrero del 2022


-- carga de datos:

-- Se insertan  los datos de la tabla production_countries:

INSERT INTO production_countries(iso_3166_1, country)
SELECT DISTINCT iso_3166_1, country
FROM tmp_production_countries;


-- Se insertan  los datos de la tabla movie_production_countries:
INSERT INTO movie_production_countries(id_movie, iso_3166_1)
SELECT DISTINCT id_movie, iso_3166_1
FROM tmp_production_countries;

-- Se insertan  los datos de la tabla production_companies:
INSERT INTO production_companies(id_production_company, name_production_company)
SELECT DISTINCT id_production_company, name_production_company
FROM tmp_production_companies;



-- Se insertan  los datos de la tabla movie_production_companies:
INSERT INTO movie_production_companies(id_movie, id_production_company)
SELECT DISTINCT id_movie, id_production_company
FROM tmp_production_companies;


-- Se insertan  los datos de la tabla spoken_languages:
INSERT INTO spoken_languages(iso_639_1, `language`)
SELECT DISTINCT iso_639_1, `language`
FROM tmp_spoken_languages;


-- Se insertan  los datos de la tabla movie_spoken_languages:
INSERT INTO movie_spoken_languages(id_movie, iso_639_1)
SELECT DISTINCT id_movie, iso_639_1
FROM tmp_spoken_languages;



-- Se insertan  los datos de la tabla person:
INSERT INTO person(credit_id, name, gender)
SELECT DISTINCT credit_id, name, gender
FROM tmp_crew;



-- Se insertan  los datos de la tabla movie_crew:
INSERT INTO movie_crew(id_movie, credit_id, id_crew, job, departament)
SELECT DISTINCT id_movie, credit_id, id_crew, job, department
FROM tmp_crew;



-- Se insertan  los datos de la tabla movie_crew:
INSERT INTO movie_cast(id_movie, cast)
SELECT DISTINCT id_movie, cast
FROM tmp_cast;


-- Se insertan  los datos de la tabla movie_genre:
INSERT INTO movie_genre(id_movie, genre)
SELECT DISTINCT id_movie, genre
FROM tmp_genres;


-- Se insertan  los datos de la tabla movie_keyword:
INSERT INTO movie_keyword(id_movie, keyword)
SELECT DISTINCT id_movie, keyword
FROM tmp_movie_keyword;


-- Se insertan  los datos de la tabla movie_director:
INSERT INTO movie_director(id_movie, credit_id)
SELECT DISTINCT m.id, c.credit_id
FROM movie_dataset m, person c
WHERE m.director = REPLACE(c.name, '"', '');



























