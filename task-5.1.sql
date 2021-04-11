/* 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.*/
update users SET created_at = NOW(); 
update users SET updated_at = NOW();

/* 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
 * время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые 
 * ранее значения.*/

ALTER TABLE users ADD new_created_at DATETIME; -- Создаем временный столбец с форматом данных DATETIME
UPDATE users SET new_created_at = STR_TO_DATE(created_at, '%d.%m.%Y %l:%i'); -- Функцией STR_TO_DATE преобразовываем строку в дату и записываем в новую колонку
ALTER TABLE users DROP created_at; -- Удаляем created_at
ALTER TABLE users CHANGE new_created_at created_at DATETIME; -- Переименовываем new_created_at

/* 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился
 *  и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке 
 * увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.*/

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150),
	value INT DEFAULT NULL
) COMMENT = 'Складские остатки товара';
INSERT INTO 
	storehouses_products (name, value) 
VALUES 
	('product_01', 10), 
	('product_02', 5), 
	('product_03', 5), 
	('product_04', 1),
	('product_05', 2), 
	('product_06', 0), 
	('product_07', 10), 
	('product_08', 0), 
	('product_09', 3),
	('product_10', 0);
SELECT 
	*, 0 AS line FROM storehouses_products WHERE value != 0
UNION SELECT 
	*, 1 AS line FROM storehouses_products WHERE value = 0
ORDER BY line, value, name;

/* 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка
 *  английских названий (may, august)*/

SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%m') IN ('may', 'august');

/* 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
 * Отсортируйте записи в порядке, заданном в списке IN.*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2) ;
