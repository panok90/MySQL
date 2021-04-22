/* 3. скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами);

6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);
7. представления (минимум 2);
8. хранимые процедуры / триггеры;
*/
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

/************************************************************************************/
CREATE TABLE catalogs ( 
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';
/************************************************************************************/ 
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desсription TEXT COMMENT 'Описание',
  price DECIMAL(11, 2) COMMENT 'Цена',
  article_number BIGINT UNSIGNED COMMENT 'Артикул',
  catalog_id BIGINT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id),
  CONSTRAINT fk_products_catalogs FOREIGN KEY (catalog_id) REFERENCES catalogs (id)
) COMMENT = 'Товарные позиции';
/************************************************************************************/
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя покупателя',
  last_name varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия покупателя',
  email varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'почта',
  phone varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'телефон',
  password_hash char(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'пароль',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY email_unique (email),
  UNIQUE KEY phone_unique (phone)
) COMMENT = 'Покупатели';
/************************************************************************************/
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES users (id)
) COMMENT = 'Заказы';
/************************************************************************************/
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_orders_products_orders FOREIGN KEY (order_id) REFERENCES orders (id),
  CONSTRAINT fk_orders_products_products FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Состав заказа';
/************************************************************************************/
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id),
  CONSTRAINT fk_discounts_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_discounts_products FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Скидки';
/************************************************************************************/
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';
/************************************************************************************/
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_storehouses_products_storehouses FOREIGN KEY (storehouse_id) REFERENCES storehouses (id),
  CONSTRAINT fk_storehouses_products_products FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Запасы на складе';
/************************************************************************************/
CREATE TABLE reviews(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED,
	review text COMMENT 'Отзыв о товаре', 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_reviews_products FOREIGN KEY (product_id) REFERENCES products (id),
	CONSTRAINT fk_reviews_users FOREIGN KEY (user_id) REFERENCES users (id)
) COMMENT = 'Отзывы покупателей';
/************************************************************************************/
CREATE TABLE ratings(
	id SERIAL PRIMARY KEY,
	review_id BIGINT UNSIGNED,
	ball FLOAT UNSIGNED COMMENT 'Величина рейтинга 0.0 до 5.0',
	CONSTRAINT fk_ratings_reviews FOREIGN KEY (review_id) REFERENCES reviews (id)
) COMMENT = 'Оценка пользователя';
/************************************************************************************/
DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	created_at DATETIME NOT NULL,
	name_table VARCHAR(255) NOT NULL,
	pk_id BIGINT NOT NULL,
	name_value VARCHAR(255) NOT NULL
)COMMENT = 'Время и дата создания записи' ENGINE=ARCHIVE;