/* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
 * С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
 * с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
 */

DROP FUNCTION IF EXISTS hello;
delimiter //
CREATE FUNCTION hello()
	RETURNS text DETERMINISTIC
	BEGIN
		 SET @now = TIME_TO_SEC(CURTIME());
		
	CASE 
		WHEN @now BETWEEN TIME_TO_SEC('06:00:00') AND TIME_TO_SEC('11:59:59') THEN 
			RETURN 'Доброе утро';
		WHEN @now BETWEEN TIME_TO_SEC('12:00:00') AND TIME_TO_SEC('17:59:59') THEN
			RETURN 'Добрый день';
		WHEN @now BETWEEN TIME_TO_SEC('18:00:00') AND TIME_TO_SEC('23:59:59') THEN
			RETURN 'Добрый вечер';
		ELSE
			RETURN 'Доброй ночи';
	END CASE;
END//
delimiter ;
SELECT hello();

/* 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
 * Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 * При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */

DELIMITER //
CREATE TRIGGER trigger_filling_products BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF ISNULL(NEW.name) THEN
		SET NEW.name = 'NoName';
	END IF;
	IF ISNULL(NEW.desсription) THEN
		SET NEW.desсription = 'Default';
	END IF;
END//
DELIMITER ;
INSERT INTO products
	(name, desсription, price, catalog_id, created_at, updated_at)
VALUES
	(NULL, "desсription", 1000000, 1, NOW(), NOW());
DROP TRIGGER trigger_filling_products;


DELIMITER //
CREATE TRIGGER trigger_correctness_products BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.desсription)) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Trigger: Name and desсription is NULL!';
	END IF;
END//
DELIMITER ;
INSERT INTO products
	(name, desсription, price, catalog_id, created_at, updated_at)
VALUES
	(NULL, NULL, 1000000, 1, NOW(), NOW());
DROP TRIGGER trigger_correctness_products;