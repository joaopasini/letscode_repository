2)


SELECT 
category
,COUNT(*)
FROM flavours
WHERE category IS NOT null
and category <> 'NULL'
GROUP BY category

3) 

SELECT 
category 
,COUNT(*)
,'A categoria' || category || 'possui' || count(*) || 'registros' AS Resultado
from flavours
where category is not null
and category <> 'NULL'
group by category
order by count(*) desc

4)

select
customer_id
,count(*) as QtdLocacoes
from rental 
group by customer_id
order by 2 desc
limit 10

5)

select 
max(return_date - rental_date) as tempoLocado
,*
from rental
 
6)

SELECT COUNT(*) FROM actor
WHERE UPPER(last_name) LIKE 'CAGE'

7)

select 
district
address AS Endereco
,postal_code AS CEP
from address
where district in ('Alberta', 'Texas')

8)

select distinct activebool from customer

select
	activebool
	,count(*) as Status
FROM
	customer
GROUP BY activebool

9)

select 
	distinct district

from address
where district like 'A%'
or district like 'E%'
or district like 'I%'
or district like 'O%'
or district like 'U%'

10)

SELECT * 


FROM PAYMENT

