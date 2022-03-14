Enunciado

Informações: SELECT * FROM orders; SELECT * FROM order_details; SELECT * FROM products; SELECT * FROM customers; Em algum momento vocês vão usar:

SUM((products.unit_price * order_details.quantity * order_details.discount)) + AVG(orders.freight) AS valor_total Em alguns momentos vocês vão usar:

SUM((products.unit_price * order_details.quantity * (1 - order_details.discount)) + AVG(orders.freight) as total_order_price Em algum momento vocês vão usar:

ROUND( SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight) ) as total_order_price Em algum momento vocês vão usar:

( SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight) ) / COUNT(orders.order_id) as mean_order_price

Obtenha uma tabela que contenha o id do pedido e o valor total do mesmo.

SELECT orders.order_id, SUM((products.unit_price * order_details.quantity * (1- order_details.discount) + AVG(orders.freight)) AS total_amount
FROM orders, order_details, products
GROUP BY 1;	
							
							
SELECT orders.order_id,
SUM((orders.freight)+(products.unit_price * order_details.quantity)-(products.unit_price * order_details.quantity * order_details.discount)) AS valor_total
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id
GROUP BY 1
ORDER BY order_id ASC;							
	
Obtenha uma lista dos 10 clientes que realizaram o maior número de pedidos, bem como o número de pedidos de cada, ordenados em ordem decrescente de nº de pedidos.

							
SELECT unit_price from products;
SELECT quantity from order_details; 
SELECT discount from order_details;
SELECT freight FROM orders;
SELECT order_id	FROM orders;						

SELECT * FROM order_details
ORDER BY order_id ASC; 		
							
SELECT * FROM order_details
WHERE order_id = 10266;							
364.8 - 18.24= 346.56
							
SELECT * FROM orders
WHERE order_id = 10266;							
frete 25.73							
	
346.56 + 25.73= 372.29							
							
							
SELECT products.unit_price, order_details.quantity, order_details.discount, orders.freight
FROM products, order_details, orders;
							
							
							
							
							

Obtenha uma tabela que contenha o id e o valor total do pedido e o nome do cliente que o realizou.

	
SELECT contact_name, customer_id, SUM((products.unit_price * order_details.quantity * (1- order_details.discount)) + AVG(orders.freight)
FROM customers, order_details, products
									 ;


Obtenha uma tabela que contenha o país do cliente e o valor da compra que ele realizou.

SELECT contact_name, country, quantity*(unit_price) AS total_purchase
FROM customers, order_details;


Obtenha uma tabela que contenha uma lista dos países dos clientes e o valor total de compras realizadas em cada um dos países. Ordene a tabela, na order descrescente, considerando o valor total de compras realizadas por país.



Obtenha uma tabela com o valor médio das vendas em cada mês (ordenados do mês com mais vendas para o mês com menos vendas).








