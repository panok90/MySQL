/*1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/

SELECT u.name, count(*) AS total FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.name
ORDER BY total DESC;
SELECT * FROM orders o ;


/*2. Выведите список товаров products и разделов catalogs, который соответствует товару.*/

SELECT p.name AS product_name, c.name AS catalog_name FROM products p 
JOIN catalogs c ON p.id = c.id;

/*3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, 
 * to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/

CREATE DATABASE flight_schedule;
USE flight_schedule;
CREATE TABLE flights(
	id int UNSIGNED NOT NULL,
	flight_from varchar(150) NOT NULL,
	flight_to varchar(150) NOT NULL	
);
CREATE TABLE cities(
	label varchar(150) NOT NULL,
	name varchar(150) NOT NULL	
);
INSERT INTO flights VALUES
  (1, 'moscow', 'omsk'),
  (2, 'novgorod', 'kazan'),
  (3, 'irkutsk', 'moscow'),
  (4, 'omsk', 'irkutsk'),
  (5, 'moscow', 'kazan');
 

INSERT INTO cities VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');

SELECT 
	id, 
	(SELECT c.name FROM cities c WHERE c.label = f.flight_from) AS flight_from, 
	(SELECT c.name FROM cities c WHERE c.label = f.flight_to) AS flight_to 
FROM flights f
ORDER BY id;
