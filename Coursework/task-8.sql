/*8. хранимые процедуры / триггеры;*/

/*Процедура получения пользователей получивших определенную (10%) скидку на товар*/
USE shop;
DROP PROCEDURE IF EXISTS pc_percent ;
DELIMITER // 
CREATE PROCEDURE pc_percent (IN var float)  
DETERMINISTIC 
COMMENT 'procedure search' 
BEGIN 
    SELECT (SELECT concat(u.last_name,' ', u.first_name) 
    		FROM users u 
    		WHERE u.id = d.user_id) AS name,
    		(SELECT p.name 
    		FROM products p 
    		WHERE p.id = d.product_id) AS products,
    		ROUND(var, 2) AS percent
   	FROM discounts d 
  	WHERE d.discount = var; 
END// 
DELIMITER ;
CALL pc_percent(0.1);

/*Триггер логирования добавления новой номенклатуры*/

DROP TRIGGER IF EXISTS log_products;
delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, name_table, pk_id, name_value)
	VALUES (created_at , 'products', NEW.id, NEW.name);
END //
delimiter ;