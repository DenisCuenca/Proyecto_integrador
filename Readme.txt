-- Universidad Técnica Particular de Loja
-- Ingeniería en Ciencias de la Computación
-- Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
-- Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
-- Estudiante: Denis Alexander Cuenca Buele | dacuenca7@utpl.edu.ec
-- Link del proyecto en Github: https://github.com/DenisCuenca/Proyecto_integrador.git
-- Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
-- Fecha: Loja, 8 de febrero del 2022


-- link a presentación: https://www.canva.com/design/DAE3wyC5qhY/Y4ncd843TG_CeD82H85yRA/view?utm_content=DAE3wyC5qhY&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink

Proyecto cargado en Github url:  https://github.com/DenisCuenca/Proyecto_integrador.git
Cuenta: DenisCuenca
Repositorio: Proyecto_integrador



Explicación del proyecto:

vie dataset” la cual presenta errores de diseño los cuales imposibilitan el uso de la misma, motivo por el cual se aplicaran varias estrategias para la modificacion de esta base de datos, que nos permitan volverla un modelo que responda de forma eficiente y estable  reglas de  normalización y su uso en futuros procesos de implementación.


A fin de crear un modelo sostenible y consistente se pretende la aplicación de reglas de normalización sobre este primer estado de la base de datos, para lo cual se debe comprender a fondo el modelo con el que se trabajará, así pues se comienza por describir la única entidad que contiene el modelo, la tabla “Movie”.

Atributos iniciales:

MOVIE:

- index
-budget 
-homepage
-id
-original language
-original title
-overview
-popularity
-realese date 
-revenue
-runtime
-status
-tagline
-title
-vote average
-vote count
- genres
-keywords
-production companies
-production countries
-spoken languages
-cast
- crew


Primera forma normal:
Al existir campos que almacenan valores multivaluados, se los separa en tablas difererntes con esperando así generar un mejor diseño, el resultado final se presenta a continuación donde se describe cada tabla con sus atributos:


- genres: id_movie, genre

-production companies: id_movie, id, company

-production countries: id_movie, iso_3166_1, country

-spoken languages: Iso_639₁, id_movie, name

-cast: name, id, id_movie

- crew: id_movie, id_crew, job, name, gender, credit_id, department

-Director:  name, id, id_movie



Segunda forma normal:
Tras haber declarado las noevas tablas se realiza el proceso de determinar las dependencias funcionales de cada tabla:



- genres:
  	id_movie → genre


-keywords: 
	 id_movie,  id → keyword

-movie_production companies:
 	 id_movie, id –>  	 id_movie, id 

-production companies:
	 id →  company name

-movie_production countries:
 	 id_movie, iso_3166_1 –>  	 id_movie, id 

-production countries :
	 iso_3166_1  → country


-movie_spoken languages :
	Iso_639_1, id_movie →  	Iso_639_1, id_movie


-spoken languages :
	Iso_639_1→  name


- crew:
	id_movie, credit_id -->   job,  department, id_crew

- person:
	credit_id → name, gender, 


-movie_director:  
	id_movie, credit_id -->  id_movie, credit_id 





 Tercera forma normal: las tablas aqui presentadas y acumplen  con la primera y segunda forma normal, por lo que segun las reglas normales nuestro modelo 
ya esta normalizado.





Finalmete se implementa en sintaxis sql, y se crea el modelo fisico de nuestra base de datos:



Concluciones:

-  El uso de las formas normales es fundamental en la creación de una base de datos, donde la información está siempre expuesta a errores de almacenamiento, y se corre el riesgo de perderla  o hacer una mal uso de esta por malas practicas.

- La base de datos movie dataset tenia errores de diseño los cuales imposibilitan el uso correcto de los datos almacenados, volviéndola para algunos fines una base de datos inútil, al menos como se presento en una primera etapa, sin embargo tras la aplicación de formas normales y otras modificaciones que nos permitan su mejor uso movie dataset se funcional y estable.



Descripción de los diferentes archivos cargados:

- Readme.txt: Archivo de texto plano que contiene explicacion del proyecto, datos de la cuenta de Github donde el proyecto está  cargado y una descripcion de los archivos del proyecto.

- Informe.docx:  Documento que contiene la explicacion profunda del proyecto y su realización, asi como el diagrama entidad-realción, claves primarias, dependencias funcionales, explicacion de formas normales, y de la estrategia de carga de datoss.


Nota: proyecto completado con los paortes de Erika Maza y Xavier Chaver, de la materia de Programación Funcional y reactiva y Practicum 1.1
