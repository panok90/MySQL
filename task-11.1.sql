/*Практическое задание по теме “Оптимизация запросов”*/

/* 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
 * в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.*/
USE x;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	created_at DATETIME NOT NULL,
	name_table VARCHAR(255) NOT NULL,
	pk_id BIGINT NOT NULL,
	name_value VARCHAR(255) NOT NULL
)COMMENT = 'Время и дата создания записи' ENGINE=ARCHIVE;

DROP TRIGGER IF EXISTS log_users;
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, name_table, pk_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


DROP TRIGGER IF EXISTS log_catalogs;
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, name_table, pk_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_products;
delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, name_table, pk_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;


/* 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/

DROP TEMPORARY TABLE IF EXISTS temp_users; 
CREATE TEMPORARY TABLE temp_users (
	id SERIAL PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	birthday_at DATE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 	);
DROP PROCEDURE IF EXISTS add_user ;
DELIMITER // 
CREATE PROCEDURE add_user ()
BEGIN
   DECLARE cost INT;
   SET cost = 0;
   label: LOOP
     IF cost < 1000000 THEN
     	INSERT INTO temp_users(name, birthday_at, created_at, updated_at) VALUES (CONCAT('user_', cost), NOW(), NOW(), NOW());
     	SET cost = cost + 1;
       ITERATE label;
     END IF;
     LEAVE label;
   END LOOP label;
END //
DELIMITER ;
SELECT * FROM temp_users;
CALL add_user();
SELECT * FROM temp_users ORDER BY id DESC;


