-- Universidad Técnica Particular de Loja
-- Ingeniería en Ciencias de la Computación
-- Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
-- Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
-- Estudiante: Denis Alexander Cuenca Buele | dacuenca7@utpl.edu.ec
-- Link del proyecto en Github: https://github.com/DenisCuenca/Proyecto_integrador.git
-- Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
-- Fecha: Loja, 8 de febrero del 2022


-- Creación de limpieza y creación de datos temporales:



-- Se borra si existe una version previa del procedimiento:
DROP TABLE IF EXISTS movie_dataset_cleaned;
-- Creacion de la tabla temporal:

CREATE TABLE movie_dataset_cleaned AS
SELECT

     -- Se almacena los valores a implementar en la tabla.
	`index`, budget, genres, homepage, id, keywords, original_language, original_title, overview, popularity,
	 production_companies, production_countries, release_date, revenue, runtime, spoken_languages, `status`,
	 tagline, title, vote_average, vote_count,CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                            (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                            REPLACE(REPLACE(cast,'\\u00e1','á'),'\\u00e5','å'),'\\u00e9','é'),
           '\\u00eb','ë'),'\\u00ed','í'),'\\u00e0','à'), '\\u00f1','ñ'),'\\u00f8','ø'),'\\u042','B'),
           '\\u0438','N'),'\\u044f','я'),'\\u0421','C'), '\\u043d','H'),'\\u0440','p'),'\\u0433','r'),
           '\\u044c','b'),'\\u067e','پ'),'\\u06cc','ی'), '\\u0645','م'),'\\u0627','ا'),'\\u0646','ن'),
           '\\u0646','ع'),'\\u062f','د'),'\\u00e8','è'), '\\u00f3','ó'),'\\u0160','Š'),'\\u0107','ć'),
           '\\u0107','ć'),'\\u00f6','ö'),'\\u00e4','ä'), '\\u00e4','ô'),'\\u00e4','ç'),'\\u0144','ń'),
           '\\u2019','’'),'\\u00fc','ü'),'\\u00c1','Á'), '\\u00ea','ê'),'\\u00ea','ê'),'\\u00e7','ç'),
           '\\u00dc','Ü'),'\\u0159','ř'),'\\u00d8','Ø'), '\\u00fa','ú'),'\\u010d','č'),'\\u010d','č'),
           '\\u00f0','ð'),'\\u0219','ș'),'\\u00d3','Ó'), '\\u0110','Đ'),'\\u0161','š'),'\\u0101','ā'),
           '\\u00c5','Å'),'\\u043b','л'),'\\u014c','Ō'), '\\u016b','ū'),'\\u014d','ō'),'\\u015b','ś'),
           '\\u00ef','ï'),'\\u021b','ț'),'\\u00c9b','ಛ'), '\\u00f4','ô'),'\\u0301','´'),'\\u00fb','û'),
           '\\u00fb','û'),'\\u1ed7','ỗ'),'\\u1ecb','ị'), '\\u1ea3','ả'),'\\u1ebf','ế'),'\\u015f','ş'),
           '\\u015ea','D'),'\\u017e','ž'),'\\u00c0','À'), '\\u0131','ı'),'\\u011f','ğ'),'\\u1ec1','ề'),
           '\\u0639','ع'),'\\u00ee','îع'),'\\u00e6','æ'), '\\u00c9','É'),'\\u00df','ß'),'\\u015ea','ᗪ')using utf8mb4) AS cast, 
     -- Se remplazan los caracteres erroneos existentes en las tablas
	CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	    (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	        (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(crew,'\\\\', '\\'),
	        """", "'"),
	 		"', '", """, """),
	 		"': '", """: """),
	 		"': ", """: "),
	 		", '", ", """),
	 		"{'", "{"""), "\\t", ""),
	        '\\u00e9', 'é'),'\\u00e1', 'á'),'\\u00f1', 'ñ'),'\\u00c9', 'É'),
	        '\\u0159','ř'),'\\u00f4', 'ô'),'\\u00f3','ó'),'\\u00ed','í'),
            '\\u00d8','Ø'),'\\u00f8','ø'),'\\u00c5','Å'),'\\u00f6','ö'),
            '\\u0142','ɫ'),'\\u017','ž'),'\\u0161','š'),'\\u00e8','è'),
	        '\\u0144','ń'),'\\u00e7','ç'),'\\u00ef','ï'),'\\u0160','Š'),
	        '\\u00fc','ü'),'\\u00d3','Ó'),'\\u00fd','ý'),'\\u00cf','ï'),
            '\\u00e3','ã'),'\\u00ee','î'),'\\u00e2','â'),'\\u00e4','ä'),
            '\\u00e5','å'),'\\u00eb','ë'),'\\u00eb','ë'),'\\u00fa','ú'),
            '\\u00df','þ'),'\\u00f0','ð'),'\\u00c1','Á'),'\\u0107','ć'),
            '\\u015','𓍃'),'\\u0165','ť'),'\\u00ea','ê'),'\\u014c','Ō'),
            '\\u00c0','À'),'\\u2019','’'),'\\u00fb','û'),'\\u00e6','æ'),
            '\\u00fe','þ'),'\\u0141','Ł '),'\\u0411','Б'),'\\u043e','o'),
            '\\u0440','p'),'\\u0438','и'),'\\u0441','с'),'\\u0421','C'),
            '\\u0443','y'),'\\u0442','T'),'\\u0430','a'),'\\u0446','ц'),
            '\\u043a','k'),'\\u0439','й'),'\\u010d','č'),'\\u5f20','张 '),
            '\\u7acb','立'),'\\u00d6','Ö'),'\\u0441','с'),'\\u010c','Č'),
            '\\u00cd','Í'),'\\u00f5','õ'),'\\u00e0','à'),'\\u00f2','ò'),
            '\\u00d4','Ô'),'\\u011b','ě'),'\\u00de','Þ'),'\\u00ec','ì'),
            '\\u00da','Ú'),'\\u010e','Ď'),'\\u0433','r'),
	         """'", """"), "'""", """")using utf8mb4) AS Crew,
       CONVERT(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(director,
           '\\u00e1','á'),'\\u00e4','ä'),'\\u00f3','ó'),
           '\\u00e9','é'),'\\u00d8','Ø'),'\\u00ed','í'),
           '\\u00e8','è'),'\\u00e7','ç'),'\\u00f4','ô'),
           '\\u0159','ř'),'\\u00f8','ø'),'\\u00c5','Å'),
           '\\u00f6','ö'),'\\u00e5','å'),'\\u00ef','ï'),
           '\\u00e6','æ'),'\\u00fb','û'),'\\u00c0','À'),
           '\\u00c1','Á'),'\\u00c9','É'),'\\u014c','Ō'),
           '\\u0161','š'),'\\u0142','ɫ'),'\\u0144','ń'),
           '\\u017','ž'),'\\u00f1','ñ')using utf8mb4) AS director
		FROM movie_dataset;


-- se elimina una version previa de la tabla
DROP PROCEDURE IF EXISTS Jsons ;
DELIMITER //
CREATE PROCEDURE Jsons()
BEGIN
     -- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
	DECLARE a INT Default 0 ;
     -- Se eliminan y crean tablas temporales para almacenar los datos:
	DROP TABLE IF EXISTS tmp_production_companies ;
	CREATE TABlE tmp_production_companies (id_movie INT, id_production_company INT, name_production_company VARCHAR (100) );
	DROP TABLE IF EXISTS tmp_production_countries ;
	CREATE TABlE tmp_production_countries (id_movie INT, iso_3166_1 VARCHAR (7), country VARCHAR (100) );
	DROP TABLE IF EXISTS tmp_spoken_languages;
	CREATE TABlE tmp_spoken_languages (id_movie INT, iso_639_1 VARCHAR (5), `language` VARCHAR (100) );
	DROP TABLE IF EXISTS tmp_crew ;
	CREATE TABlE tmp_crew(id_movie INT, id_crew INT, job VARCHAR (200), name VARCHAR (400), gender INT, credit_id VARCHAR (50), department VARCHAR (50) );
	DROP TABLE IF EXISTS tmp_genres;
	CREATE TABLE tmp_genres (id_movie INT,genre VARCHAR(100));
	DROP TABLE IF EXISTS tmp_cast;
	CREATE TABLE tmp_cast(id_movie INT, cast VARCHAR(100));
	DROP TABLE IF EXISTS tmp_movie_keyword;
	CREATE TABLE tmp_movie_keyword(id_movie INT, keyword VARCHAR(100));

-- inicio del loop
  simple_loop: LOOP
          -- Se insertan los datos en formato json en las tablas temporales:
		INSERT INTO tmp_production_companies (id_movie, id_production_company, name_production_company)
		SELECT id as id_Movie,
               
			JSON_EXTRACT(CONVERT(production_companies using utf8mb4), CONCAT("$[",a,"].id")) AS id_production_company,
			JSON_EXTRACT(CONVERT(production_companies using utf8mb4), CONCAT("$[",a,"].name")) AS id_production_company
		FROM movie_dataset m ;
		INSERT INTO tmp_production_countries (id_movie, iso_3166_1, country)
		SELECT id,
			JSON_EXTRACT(production_countries, CONCAT('$[',a,'].iso_3166_1')) AS iso_3166_1,
			JSON_EXTRACT(production_countries , CONCAT('$[',a,'].name')) AS country
		FROM movie_dataset m ;
		INSERT INTO tmp_spoken_languages (id_movie, iso_639_1, `language`)
		SELECT id,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].iso_639_1')) AS iso_639_1,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].name')) AS language
		FROM movie_dataset m ;
		INSERT INTO tmp_crew (id_movie, id_crew, job, name, gender, credit_id, department)
		SELECT id as id_Movie,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].id")) AS id_crew,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].job")) AS job,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].name")) AS name,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].gender")) AS gender,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].credit_id")) AS credit_id,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].department")) AS department
		FROM movie_dataset_cleaned m;
		INSERT INTO tmp_genres (id_movie, genre)
        SELECT * FROM (
			SELECT id as id_Movie,
				REPLACE(JSON_EXTRACT(CONCAT('["', REPLACE(REPLACE (genres, ' ', '","'), 'Science","Fiction', 'Science Fiction'), '"]'),
				    CONCAT("$[",a,"]")), """","") AS genre
			FROM movie_dataset_cleaned) t
        WHERE genre != "";
		INSERT INTO tmp_cast(id_movie, cast)
		SELECT id,
          -- Se implementa una estructura condicional que nos permita conocer la longitu y espacios en blanco es¿xistentes en cada tabla.
        REPLACE(JSON_EXTRACT(
		CONCAT ('["',
	   			IF(SpacesNumber >= 13, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -14), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 11, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -12), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 9, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -10), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 7, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -8), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 5, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -6), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >=3, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -4), ' ', 2), '","'), '') ,
        		IF(SpacesNumber >=1, CONCAT(SUBSTRING_INDEX(cast, ' ', -2), '"'), ''),
        ']'), CONCAT("$[",a,"]")),
        "=", "") AS CastJSon
		FROM (
		SELECT id, cast, LENGTH(cast) - LENGTH(REPLACE(cast, ' ', '')) AS SpacesNumber FROM (
		SELECT id,
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cast, '"',''),' Jr.', '=Jr.'), ' Jr ', '=Jr '), '. ', '.='),
	    	' The ', ' The='), ' the ', ' the='), 'the=Cable Guy', 'the=Cable=Guy' ), 'Tupac Amaru Shakur', 'Tupac Amaru=Shakur')  AS cast
		FROM movie_dataset WHERE Cast <> '') t1) t2;

		INSERT INTO tmp_movie_keyword
            SELECT id,
          -- Se implementa una estructura condicional que nos permita conocer la longitu y espacios en blanco es¿xistentes en cada tabla.
                REPLACE(JSON_EXTRACT(REPLACE(
                    CONCAT('["',
                        IF(SpacesNumber >= 13, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -14), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 11, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -12), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 9, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -10), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 7, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -8), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 5, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -6), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >=3, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -4), ' ', 2), '","'), '') ,
        		        IF(SpacesNumber >=1, CONCAT(SUBSTRING_INDEX(keywords, ' ', -2), '"'), ''),
                ']'),'["]','[]'), CONCAT("$[",a,"]")),
                "=", "") AS keywordJson
            FROM(
                Select id, keywords, LENGTH(keywords) - LENGTH(REPLACE(keywords, ' ', '')) AS SpacesNumber FROM (
                SELECT id,
                REPLACE(REPLACE(keywords, '"',''), 'marvel comic', 'marvel=comic') AS keywords
                FROM movie_dataset WHERE keywords <> '') t1) t2;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;

     -- se limpial los valores nulos en caso de exisir
    DELETE FROM tmp_production_companies WHERE id_production_company IS NULL ;
	DELETE FROM tmp_production_countries WHERE iso_3166_1 IS NULL ;
	DELETE FROM tmp_spoken_languages WHERE iso_639_1 IS NULL ;
    DELETE FROM tmp_crew WHERE id_crew IS NULL ;
	DELETE FROM tmp_genres WHERE genre IS NULL;
	DELETE FROM tmp_cast WHERE cast is NULL;
	DELETE FROM tmp_movie_keyword WHERE keyword IS NULL;
END //
DELIMITER ;
Call Jsons();


-- Se eliminal las tablas temporales, una vez creadas las tablas definitivas.
DROP TABLE IF EXISTS tmp_cast;
DROP TABLE IF EXISTS tmp_genres;
DROP TABLE IF EXISTS tmp_production_countries;
DROP TABLE IF EXISTS tmp_production_companies;
DROP TABLE IF EXISTS tmp_spoken_languages;
DROP TABLE IF EXISTS tmp_crew;
DROP TABLE IF EXISTS movie_dataset_cleaned;
DROP TABLE IF EXISTS tmp_spoken_languages;
DROP TABLE IF EXISTS tmp_movie_keyword;
