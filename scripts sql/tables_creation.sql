-- Universidad Técnica Particular de Loja
-- Ingeniería en Ciencias de la Computación
-- Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
-- Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
-- Estudiante: Denis Alexander Cuenca Buele | dacuenca7@utpl.edu.ec
-- Link del proyecto en Github:  https://github.com/DenisCuenca/Proyecto_integrador.git
-- Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
-- Fecha: Loja, 8 de febrero del 2022


-- Creacion de tablas:


-- Se borran las tablas implementadas, en caso de existir:

DROP TABLE IF EXISTS spoken_languages;
DROP TABLE IF EXISTS production_countries;
DROP TABLE IF EXISTS production_companies;
DROP TABLE IF EXISTS worker;
DROP TABLE IF EXISTS credit;
DROP TABLE IF EXISTS movies_crew;
DROP TABLE IF EXISTS movies_production_companies;
DROP TABLE IF EXISTS movies_production_countries;
DROP TABLE IF EXISTS movies_spoken_languages;
DROP TABLE IF EXISTS movie;


-- Creacion de tablas movie.


-- Clave primaria: id

-- Dependecia funcional de movie:
--         id --> `index`, budget, genres, homepage, keywords, original_language, original_title, overview, popularity, release_date, revenue, runtime, `status`,
--             	 tagline, title, vote_average, vote_count, cast, director

-- Extra-info: la tabla movie nos sirve para representar la información extraida del archivo CSV.

CREATE TABLE movie AS
SELECT DISTINCT `index`, budget, genres, homepage, id, keywords, original_language, original_title, overview, popularity, release_date, revenue, runtime, `status`,
	 tagline, title, vote_average, vote_count, cast, director
FROM movie_dataset_cleaned ;
ALTER TABLE movie ADD PRIMARY KEY (id);






-- Creación de tabla spoken_languages:

-- Clave primaria: iso_639_1

-- Primera Forma normal: la tabla surge de la primera forma normal, pues está contiene atributos multivariados, que se deben separar.

-- Dependecia funcional de spoken_languages:
--         iso_639_1 --> language

CREATE TABLE spoken_languages(
	iso_639_1 VARCHAR(5) NOT NULL,
	`language` VARCHAR(100),
	PRIMARY KEY(iso_639_1)
);


-- Creación de tabla movie_genre:

-- Clave primaria: id_movie, genres

-- Primera Forma normal: la tabla surge de la primera forma normal, pues está contiene atributos multivariados, que se deben separar.

-- Dependecia funcional de movie-genre:
--         id-movie, genre -->id-movie, genre

CREATE TABLE movie_genre(
    id_movie INT not null,
    genre VARCHAR(100),
    PRIMARY KEY (id_movie, genre),
    CONSTRAINT FK_id_movie5 FOREIGN KEY (id_movie) REFERENCES movie(id)
);







-- Creación de tabla production_countries

-- Clave primaria:  iso_3166_1

-- Primera Forma normal: la tabla surge de la primera forma normal contiene varios atributos en formato JSON, que crean otra tabla.

-- Dependecia funcional de production_countries:
--         iso_3166_1 --> country

CREATE TABLE production_countries(
	iso_3166_1 VARCHAR(5) NOT NULL,
	country VARCHAR (100),
	PRIMARY KEY(iso_3166_1)
);






-- Creación de tabla production_companies

-- Clave primaria: id_production_company

-- Primera Forma normal: la tabla surge de la primera forma normal contiene varios atributos en formato JSON, que crean otra tabla.

-- Dependecia funcional de production_countries:
--         id_production_company --> name_production_company

CREATE TABLE production_companies(
	id_production_company INT NOT NULL,
	name_production_company VARCHAR (100),
	PRIMARY KEY(id_production_company)
);



-- Creacion de tabla person

-- Clave primaria:  credit_id

-- Segunda Forma normal: la tabla surge de la segunda forma normal la clave primaria de la tabla crew no define a los atributos de la tabla person

-- Dependecia funcional de person:
--         credit_id --> ´name´

CREATE TABLE person(
	credit_id CHAR(100) NOT NULL,
	`name` VARCHAR(500),
	gender INT,
	PRIMARY KEY (credit_id)
);







-- Creacion de tabla movie_production_companies
-- Clave primaria:  id_Movie, id_production_company

-- Primera Forma normal: la tabla surge de la primera forma normal, la tabla contiene un formato JSON, que sugieren la creacion de otra tabla con cardinalidad m:n
--                       la cual se conecta atraves de movie_production_companies

-- Dependecia funcional de person:
--         id_Movie, id_production_company --> id_Movie, id_production_company

CREATE TABlE movie_production_companies (
	id_movie INT NOT NULL,
	id_production_company INT NOT NULL,
	PRIMARY KEY(id_Movie, id_production_company),
	CONSTRAINT FK_id_movie FOREIGN KEY(id_movie) REFERENCES movie(id),
	CONSTRAINT FK_id_production_company FOREIGN KEY(id_production_company)
      REFERENCES production_companies(id_production_company)
);




-- Creacion de tabla movie_production_countries

-- Clave primaria:  id_movie, iso_3166_1

-- Primera Forma normal: la tabla surge de la primera forma normal, la tabla contiene un formato JSON, que sugieren la creacion de otra tabla con cardinalidad m:n
--                       la cual se conecta atraves de movie_production_countries.

-- Dependecia funcional de person:
--         id_movie, iso_3166_1 --> id_movie, iso_3166_1

CREATE TABlE movie_production_countries (
	id_movie INT NOT NULL,
	iso_3166_1 VARCHAR (5) NOT NULL,
	PRIMARY KEY(id_movie, iso_3166_1),
	CONSTRAINT FK_id_movie2 FOREIGN KEY(id_movie)
     REFERENCES movie(id),
	CONSTRAINT FK_iso_3166_1 FOREIGN KEY(iso_3166_1)
     REFERENCES production_countries(iso_3166_1)
);





-- Creacion de tabla movie_spoken_languages

-- Clave primaria:  id_movie, iso_639_1

-- Primera Forma normal: la tabla surge de la primera forma normal, la tabla contiene un formato JSON, que sugieren la creacion de otra tabla con cardinalidad m:n
--                       la cual se conecta atraves de movie_spoken_languages.

-- Dependecia funcional de person:
--         id_movie, iso_639_1 --> id_movie, iso_639_1

CREATE TABlE movie_spoken_languages (
	id_movie INT NOT NULL,
	iso_639_1 VARCHAR (5) NOT NULL,
	PRIMARY KEY(id_movie, iso_639_1),
	CONSTRAINT FK_id_movie3 FOREIGN KEY(id_movie)
      REFERENCES movie(id),
	CONSTRAINT FK_iso_639_1 FOREIGN KEY(iso_639_1)
      REFERENCES spoken_languages(iso_639_1)
);




-- Creacion de tabla movie_crew
-- Clave primaria:  id_movie, credit_id

-- Primera Forma normal: la tabla surge de la primera forma normal, la tabla contiene un formato JSON, que sugieren la creacion de otra tabla con cardinalidad m:n
--                       la cual se conecta atraves de movie_crew.

-- Dependecia funcional de person:
--         id_movie, credit_id --> id_movie, credit_id


CREATE TABLE movie_crew (
	id_movie INT NOT NULL,
	credit_id CHAR(100) NOT NULL,
	id_crew INT,
	job VARCHAR(100),
	departament VARCHAR(100),
	PRIMARY KEY(id_movie, credit_id),
	CONSTRAINT FK_id_movie4 FOREIGN KEY (id_movie) 
     REFERENCES movie(id),
	CONSTRAINT FK_credit_id FOREIGN KEY (credit_id) 
     REFERENCES person(credit_id)
);




-- Creacion de tabla movie_keyword

-- Clave primaria:  id_movie, credit_id

-- Primera Forma normal: la tabla surge de la primera forma normal, pues contiene el atributo multivariado keywords, por lo que se lo separa en otra tabla.

-- Dependecia funcional de person:
--         id_movie, keyword --> id_movie, keyword

CREATE TABLE movie_keyword(
    id_movie INT not null,
    keyword VARCHAR(100) NOT NULL ,
    PRIMARY KEY (id_movie, keyword),
    CONSTRAINT FK_id_movie6 FOREIGN KEY (id_movie) 
    REFERENCES movie(id)
);





-- Creacion de tabla movie_cast
-- Clave primaria:  id_movie, cast

-- Primera Forma normal: la tabla surge de la primera forma normal, pues contiene un atributo multivariado cast, por lo que se crea otra tabla.

-- Dependecia funcional de person:
--         id_movie, cast --> id_movie, cast


CREATE TABLE movie_cast(
    id_movie INT NOT NULL,
    cast VARCHAR(100),
    PRIMARY KEY (id_movie, cast),
    CONSTRAINT FK_id_movie7 FOREIGN KEY (id_movie) 
     REFERENCES movie(id)
);




-- Creacion de tabla movie_director
-- Clave primaria:  id_movie, credit_id

-- Primera Forma normal: la tabla surge de la primera forma normal, pues contiene un atributo multivariado director, por lo que se crea otra tabla.

-- Dependecia funcional de person:
--         d_movie, credit_id --> d_movie, credit_id

CREATE TABLE movie_director(
    id_movie INTEGER NOT NULL,
	credit_id CHAR(100),
	PRIMARY KEY (id_movie, credit_id),
	CONSTRAINT FK_id_movie8 FOREIGN KEY (id_movie) 
     REFERENCES movie(id),
	CONSTRAINT FK_credit_id2 FOREIGN KEY (credit_id) 
     REFERENCES person(credit_id)
);

