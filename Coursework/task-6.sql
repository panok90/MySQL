/* 6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);*/

/* Лучший покупатель*/
SELECT concat(u.last_name,' ', u.first_name) AS name ,  sum(op.total*p.price) AS total
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN orders_products op ON o.id = op.order_id
JOIN products p ON op.product_id = p.id
GROUP BY u.last_name
ORDER BY total DESC;

	
/*Выручка*/
SELECT 'total' AS revenue , sum(op.total*p.price) AS total
FROM orders_products op
JOIN products p ON op.product_id = p.id ;

