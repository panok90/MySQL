/*5. скрипты наполнения БД данными;*/
USE shop;
INSERT INTO catalogs 
  (name)
VALUES
  ('Процессоры'),
  ('Материнские платы'),
  ('Видеокарты'),
  ('Жесткие диски'),
  ('Оперативная память'),
  ('Системы охлаждения'),
  ('Блоки питания'),
  ('Корпуса');

 INSERT INTO products
  (name, desсription, price, catalog_id, article_number)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1, 1459834),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1, 1174864),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1, 3265341),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1, 1346742),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2, 5422456),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2, 2312467),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2, 8543970),
  ('MSI B250M', 'Материнская плата MSI B250M, B250, Socket 1151, DDR4, mATX', 4060.00, 2, 12121234),
  ('MSI nVidia GeForce GT 710', 'Видеокарта MSI nVidia GeForce GT 710 , GT 710 1GD3H LP', 3150.00, 3, 352141),
  ('ASUS nVidia GeForce GT 1030', 'Видеокарта ASUS nVidia GeForce GT 1030 , GT1030-2G-BRK', 7590.00, 3, 480777),
  ('PALIT nVidia GeForce GTX 1050TI', 'Видеокарта PALIT nVidia GeForce GTX 1050TI , PA-GTX1050Ti StormX 4G', 19900.00, 3, 1184633),
  ('AMD Radeon R7', 'Модуль памяти AMD Radeon R7 Performance Series R748G2606U2S-UO DDR4 — 8ГБ', 3490.00, 5, 1085015),
  ('CORSAIR Vengeance', 'Модуль памяти CORSAIR Vengeance CMSX32GX4M2A2666C18 DDR4 — 2x 16ГБ', 16990.00, 5, 121252),
  ('DEEPCOOL GAMMAXX 400', 'Устройство охлаждения(кулер) DEEPCOOL GAMMAXX 400 BLUE BASIC', 1570.00, 6, 1161762),
  ('INTEL E41759', 'Устройство охлаждения(кулер) INTEL E41759', 760.00, 6, 6731234),
  ('AEROCOOL VX PLUS 500W', 'Блок питания AEROCOOL VX PLUS 500W, 500Вт, черный', 2180.00, 7, 1049256),
  ('SEASONIC S12III-500', 'Блок питания SEASONIC S12III-500 (SSR-500GB3), 500Вт, черный', 4870.00, 7, 1217449),
  ('SEASONIC PRIME Fanless TX-700', 'Блок питания SEASONIC PRIME Fanless TX-700, 700Вт, черный', 26460.00, 7, 1413121),
  ('ATX ZALMAN i3', 'Корпус ATX ZALMAN i3, черный', 3960.00, 8, 1071135),
  ('ATX FRACTAL DESIGN FOCUS', 'Корпус ATX FRACTAL DESIGN FOCUS G Window, белый', 5200.00, 8, 474488),
  ('TOSHIBA X300', 'Жесткий диск TOSHIBA X300 HDWE140EZSTA', 86900.00, 4, 330482);  

 INSERT INTO users
  (first_name, last_name, email, phone, password_hash, birthday_at, created_at)
VALUES
 ('Nichole','Wunsch','mfranecki@example.net','(656)428-24','b7ff01c99b74fcdb03dae4eae9cc1c06e39daf24','2001-07-01 05:20:30', NOW()),
 ('Kennith','Crooks','kerluke.lessie@example.org','06168295114','198af55a3677788e4172e3ceb3323fc09bcc5595','1989-12-11 00:04:22', NOW()),
 ('Griffin','Block','mraz.joannie@example.net','(023)230-40','58d12b0f09be569879e54a438a4d3dd2508ffae9','1993-01-27 01:11:29', NOW()),
 ('Nakia','Harris','laila83@example.net','327.808.110','137c22391c1661b9bf32a6d34c42f64940f57558','1981-12-12 05:00:14', NOW()),
 ('Anne','Yost','labadie.susan@example.com','361-926-774','02e6d914c392f8404784d64313751cceb54d7dd0','1976-09-07 15:06:53', NOW()),
 ('Gerry','Jacobson','jerald43@example.net','+23(4)45263','69a08464ebb3351f43104cc8cb2a00cb51641c40','1994-01-23 04:22:05', NOW()),
 ('Jaycee','Hodkiewicz','usimonis@example.com','1-778-196-6','cedad6d7c965675f62f54265a432089ae5e93724','1987-07-08 23:00:57', NOW()),
 ('Lucio','Connelly','frederique40@example.com','(287)079-85','43044e5b35eabdca398564308d12c2876c9d548f','2012-07-16 03:09:26', NOW()),
 ('Pierre','Gutkowski','gulgowski.sterling@example.net','604-385-469','07c9a20b4f27a1c2c7572e3094667a84f7f76a88','2012-10-11 12:48:33', NOW()),
 ('Braden','Kirlin','ewell40@example.net','+50(2)09459','d573fb2d8a6871fb102348f2b2a477278a34a993','1986-05-28 18:47:30', NOW()),
 ('Dedrick','Wisozk','brown.opal@example.org','1-167-183-1','65811a0dc9ba7717ed9bdd1efa337612b521e024','2017-05-17 01:18:28', NOW()),
 ('Caleigh','Rowe','kessler.sim@example.org','+59(6)03464','1823b62603f3eb84ee66848d4e892080dca98f58','1997-01-15 12:46:30', NOW()),
 ('Marley','Greenfelder','boyer.eileen@example.net','(477)945-69','b9629cfa9e524ff90d85f98bae8c7aa8aa4981fa','1978-12-20 23:23:39', NOW()),
 ('Tyree','Russel','gbergstrom@example.net','482-163-042','c25923e8aa73eb5f9f71a73fac49cb7cf295a297','1981-05-28 07:55:30', NOW()),
 ('Jonathon','Dicki','ethelyn82@example.com','1-094-292-8','16dd3750562d02e12c7cd371ec9245a987f15f4a','1981-10-10 07:04:42', NOW()),
 ('Ethyl','Dicki','hoeger.albert@example.net','204.538.731','9c47383c6810ef0477c72e2f787b8245b412c86a','2007-05-07 06:31:01', NOW()),
 ('Rosendo','Mraz','kreiger.jarvis@example.com','461-637-820','036f19be047bc7972f0d92cfd1776119996de870','1982-09-23 21:15:30', NOW()),
 ('Amos','Nolan','jarod26@example.org','1-181-289-2','a8a63b00b8b49d3fda2c29584cd7edc8b70c40fc','1988-06-07 17:29:21', NOW()),
 ('Alena','Mayert','wilma49@example.org','393.766.403','9af8c307d8142e03dc23af00c7a92e7fbdd01bab','1984-08-09 04:50:51', NOW()),
 ('Lavina','Halvorson','alexie83@example.com','06358073661','ae566723410359ef3a80af28ce210b55fb459705','1981-02-18 13:44:28', NOW()),
 ('Hassie','Mitchell','bruen.ryleigh@example.net','02079482891','0bed1aaef7e126e46ae9cec1abb766ab28b42da4','1996-06-10 10:17:54', NOW());

INSERT INTO storehouses 
	(name, created_at)
VALUES
	('Склад_01', NOW()),
	('Склад_02', NOW()),
	('Склад_03', NOW()),
	('Склад_04', NOW());

INSERT INTO storehouses_products 
	(storehouse_id, product_id, value, created_at) 
VALUES 
	(1, 10, 1, NOW()), 
	(1, 20, 1, NOW()), 
	(1, 1, 4, NOW()), 
	(1, 3, 2, NOW()),
	(1, 5, 5, NOW()), 
	(1, 16, 2, NOW()), 
	(1, 2, 1, NOW()), 
	(1, 11, 11, NOW()), 
	(1, 17, 1, NOW()),
	(1, 19, 2, NOW()),
	(2, 14, 4, NOW()), 
	(2, 12, 1, NOW()), 
	(2, 13, 2, NOW()), 
	(2, 3, 5, NOW()),
	(2, 5, 3, NOW()), 
	(2, 6, 2, NOW()), 
	(2, 20, 2, NOW()), 
	(2, 11, 1, NOW()), 
	(2, 17, 2, NOW()),
	(2, 9, 3, NOW()),
	(3, 5, 1, NOW()), 
	(3, 18, 1, NOW()), 
	(3, 10, 4, NOW()), 
	(3, 13, 2, NOW()),
	(3, 15, 5, NOW()), 
	(3, 16, 2, NOW()), 
	(3, 2, 1, NOW()), 
	(3, 1, 11, NOW()), 
	(3, 7, 1, NOW()),
	(3, 9, 2, NOW()),
	(4, 1, 1, NOW()), 
	(4, 12, 4, NOW()), 
	(4, 11, 5, NOW()), 
	(4, 4, 2, NOW()),
	(4, 15, 3, NOW()), 
	(4, 19, 2, NOW()), 
	(4, 20, 7, NOW()), 
	(4, 10, 3, NOW()), 
	(4, 7, 5, NOW()),
	(4, 9, 2, NOW());

INSERT INTO orders
	(user_id, created_at) 
VALUES                    
	(1, NOW()),
	(1, NOW()),
	(2, NOW()),
	(4, NOW()),
	(6, NOW()),
	(7, NOW()),
	(9, NOW()),
	(11, NOW()),
	(13, NOW()),
	(15, NOW()),
	(17, NOW()),
	(19, NOW()),
	(21, NOW()),
	(3, NOW()),
	(8, NOW()),
	(10, NOW()),
	(12, NOW()),
	(14, NOW()),
	(16, NOW()),
	(18, NOW()),
	(20, NOW()),
	(14, NOW()),
	(15, NOW());

INSERT INTO orders_products
	(order_id, product_id, total, created_at) 
VALUES
	(1, 10, 1, NOW()), 
	(1, 20, 1, NOW()), 
	(1, 1, 1, NOW()), 
	(1, 3, 2, NOW()),
	(2, 5, 1, NOW()), 
	(3, 16, 2, NOW()), 
	(3, 2, 1, NOW()), 
	(4, 11, 1, NOW()), 
	(4, 17, 1, NOW()),
	(5, 19, 2, NOW()),
	(6, 14, 1, NOW()), 
	(7, 12, 1, NOW()), 
	(8, 13, 2, NOW()), 
	(8, 3, 2, NOW()),
	(9, 5, 1, NOW()), 
	(10, 6, 1, NOW()), 
	(11, 20, 2, NOW()), 
	(12, 11, 1, NOW()), 
	(13, 17, 2, NOW()),
	(14, 9, 1, NOW()),
	(15, 5, 1, NOW()), 
	(16, 18, 1, NOW()), 
	(17, 10, 1, NOW()), 
	(17, 13, 2, NOW()),
	(18, 15, 1, NOW()), 
	(19, 16, 2, NOW()), 
	(20, 2, 1, NOW()), 
	(21, 1, 1, NOW()), 
	(22, 7, 1, NOW()),
	(23, 9, 2, NOW()),
	(4, 1, 1, NOW()), 
	(5, 12, 1, NOW()), 
	(5, 11, 2, NOW()), 
	(7, 4, 2, NOW()),
	(14, 15, 1, NOW()), 
	(14, 19, 2, NOW()), 
	(13, 20, 1, NOW()), 
	(16, 10, 3, NOW()), 
	(21, 7, 5, NOW()),
	(23, 9, 2, NOW()),
	(12, 10, 1, NOW()), 
	(10, 20, 1, NOW()), 
	(11, 1, 2, NOW()), 
	(2, 3, 2, NOW()),
	(13, 5, 2, NOW()), 
	(2, 16, 2, NOW()), 
	(18, 2, 1, NOW()), 
	(18, 11, 4, NOW()), 
	(19, 17, 1, NOW()),
	(19, 19, 2, NOW()),
	(20, 14, 1, NOW()), 
	(20, 12, 1, NOW()), 
	(20, 13, 2, NOW()), 
	(20, 3, 1, NOW());

INSERT INTO discounts 
	(user_id , product_id, discount, started_at, finished_at) 
VALUES
	(1, 10, 0.1, DATE_ADD(NOW(), INTERVAL -7 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY)), 
	(1, 20, 0.1, DATE_ADD(NOW(), INTERVAL -7 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY)), 
	(1, 3, 0.1, DATE_ADD(NOW(), INTERVAL -7 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY)), 
	(1, 1, 0.1, DATE_ADD(NOW(), INTERVAL -7 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY)), 
	(2, 16, 0.05, DATE_ADD(NOW(), INTERVAL -7 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY));

INSERT INTO reviews
	(user_id , product_id, review) 
VALUES
	(3, 19, 'Отличный БП, рекомендую.'),
	(15, 9, 'Видеокарта сгорела после трех дней работы, не рекомендую.'),
	(20, 1, 'Очень быстрый процессор, но дорогой.'),
	(15, 20, 'Очень дорогой!!!'),
	(9, 4, 'Не дорогой и быстрый, покупкой доволен.');

INSERT INTO ratings
	(review_id , ball) 
VALUES
	(1, 4.5),
	(2, 1.0),
	(3, 4.0),
	(4, 3.5),
	(5, 5.0);