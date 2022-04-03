-- INSTRUCCIONES DESAFIO TOP 100

-- 1.CREATE DB peliculas
CREATE DATABASE peliculas;
-- 2. Cargar ambos archivos a su tabla correspondiente
CREATE TABLE peliculas(id SERIAL, pelicula VARCHAR(100), ano_estreno INT, director VARCHAR(60), PRIMARY KEY (id));
CREATE TABLE reparto(id SERIAL, nombre_actor VARCHAR(60), FOREIGN KEY (id) REFERENCES peliculas(id));
\copy peliculas FROM 'directorio/peliculas.csv' csv header;
\copy reparto FROM 'directorio/reparto.csv' csv;
-- 3. Obtener el id de la pelicula 'Titanic'
SELECT id FROM peliculas WHERE pelicula='Titanic';
-- 4. Listar a todos los actores que aparecen en la pelicula 'Titanic'
SELECT nombre_actor FROM reparto WHERE id='2'
-- 5. Consultar en cuántas películas del top 100 participa Harrison FOrd.
SELECT COUNT(id) FROM reparto WHERE nombre_actor= 'Harrison Ford';
-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título ASC
SELECT pelicula FROM peliculas WHERE ano_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;
-- 7. Hacer una consulta SQL que muestre titulos con su longitud, long AS 'longitud_titulo'
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas GROUP BY pelicula;
-- 8. Consultar longitud mayor de los titulos de las peliculas.
SELECT MAX(LENGTH(pelicula)) FROM peliculas;

