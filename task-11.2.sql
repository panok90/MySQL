/*Практическое задание по теме “NoSQL”*/
/* 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.*
 */
// добавляем элементы в коллекцию
SADD ip 192.168.0.1
SADD ip 192.168.0.2
SADD ip 192.168.0.3
// список ip
SMEMBERS ip
// количество элементов коллекции
SCARD ip

/* 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному 
 * адресу и наоборот, поиск электронного адреса пользователя по его имени. */

SET boris@example.com Boris
SET Boris boris@example.com
GET boris@example.com
GET Boris

/* 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.*/

db.shop.insert({"catalogs": "Процессоры"})
db.shop.insert({"catalogs": "Видеокарты"})
db.shop.insertMany([{"catalogs": "Материнские платы"}, {"catalogs": "Жесткие диски"}])

db.shop.update({"catalogs": Процессоры}, {$set: {"products":["Intel Core i3-8100", "AMD FX-8320E", "Intel Core i5-7400"] }})
db.shop.update({"catalogs": "Материнские платы"}, {$set: {"products":["ASUS ROG MAXIMUS X HERO", "MSI B250M GAMING PRO"] }})
