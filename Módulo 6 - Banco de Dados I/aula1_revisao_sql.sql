SELECT
	*
FROM 
	actor

SELECT 
	first_name
	,last_name
FROM
	actor
	
SELECT	
	-- first_name AS PrimeiroNome
	-- ,last_name AS UltimoNome
	,first_name || ' ' || last_name as NomeCompleto 

FROM 
	actor
	
SELECT 
	title
	,release_year
	,rating
FROM 
	film

SELECT 
	DISTINCT rating
FROM 
	film
	
SELECT * from film
update film set release_year

SELECT * FROM ADDRESS

SELECT 
	district
	,city_id
FROM 
	address
	
SELECT DISTINCT 
	rating
	,CASE WHEN rating = 'R' THEN 'Adulto' 
		  WHEN rating = 'G' THEN 'Idosos'
		  WHEN rating = 'PG' THEN 'Adolescente'
		  WHEN rating = 'PG-13' THEN 'Infantil'
		  ELSE 'Outros'
END AS Classificacao
FROM film

SELECT * FROM payment

SELECT 
	CASE WHEN amount > 7 and staff_id = 2 then 'Pagou caro na loja A'
	ELSE 'Pagou menos caro na loja B' END
	,*
FROM payment

select * 
from film
WHERE -- filtrar o resultado da minha consulta
	rental_duration > 3
	AND RATING = 'G'
	