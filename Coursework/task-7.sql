/*7. представления (минимум 2);*/

/*С помощью представления будет создаваться таблица с остатками и ценой товара по конкретному складу*/
USE shop;

DROP VIEW IF EXISTS view_storehouse_remains;
CREATE VIEW view_storehouse_remains AS	
SELECT p.name AS products, sp.value , p.price, sp.value*p.price AS total
FROM storehouses_products sp, products p 
WHERE sp.storehouse_id = 4 AND sp.product_id = p.id;

SELECT * FROM view_storehouse_remains;

/*С помощью представления будет создаваться таблица с самой продоваемой номенклатурой*/

DROP VIEW IF EXISTS view_sale;
CREATE VIEW view_sale AS
SELECT p.name AS products, count(op.total) AS total
FROM orders_products op
JOIN products p ON p.id = op.product_id
GROUP BY p.name
ORDER BY total DESC, name;

SELECT * FROM view_sale;
