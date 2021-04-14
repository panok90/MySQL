/*Практическое задание по теме “Транзакции, переменные, представления”*/
/* 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
 *Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/

START TRANSACTION;
	INSERT INTO sample.users (SELECT * FROM shop.users WHERE shop.users.id = 1);
COMMIT;


/* 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.*/

CREATE VIEW resulting_table AS SELECT p.name AS name, c.name AS catalog_name FROM products p, catalogs c WHERE p.catalog_id = c.id;

/* 3. (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 
 *2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август,
 * выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.*/
DROP TABLE IF EXISTS august_date;
CREATE TABLE august_date (created_at date);
INSERT INTO august_date VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17');

CREATE TEMPORARY TABLE august_days (
  calendar_day INT
);
INSERT INTO august_days
VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
       (11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
       (21), (22), (23), (24), (25), (26), (27), (28), (29), (30);
     
CREATE TEMPORARY TABLE calendar SELECT DATE('2018-08-01' + INTERVAL l.calendar_day DAY) AS current_day FROM august_days AS l;

SELECT 
	calendar.current_day,
	(IF(calendar.current_day IN (SELECT created_at FROM august_date), 1, 0)) AS v 
FROM 
	calendar;


/* 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы,
 *  оставляя только 5 самых свежих записей.*/
DROP TEMPORARY TABLE tab;
CREATE TEMPORARY TABLE tab (created_at date);
INSERT INTO tab VALUES
	('2021-01-01'),
	('2020-08-04'),
	('2016-11-16'),
	('2021-04-17'),
	('2013-01-01'),
	('2012-08-04'),
	('2010-11-16'),
	('2004-04-17'),
	('2017-01-01'),
	('2009-08-04'),
	('2020-11-16'),
	('2019-04-17');


PREPARE del_date from "DELETE FROM tab ORDER BY created_at LIMIT ?";
SET @ROWS = (SELECT COUNT(*)-5 FROM tab);
EXECUTE del_date USING @ROWS;
SELECT created_at FROM tab;
	