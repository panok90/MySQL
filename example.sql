/* 
 * 2. Создайте базу данных example, разместите в ней таблицу users, 
 * состоящую из двух столбцов, числового id и строкового name
 */

-- Создаем БД, если не существует
CREATE DATABASE if not exists example;
-- Удаляем таблицу, если существует
drop table if exists example.users;
-- Создаем таблицу с двумя колонками
create table example.users (id INT unsigned not null primary key auto_increment,
	name char(50));
-- Создаем записи
insert into example.users (name) values ('Иванов Иван Иванович');
insert into example.users (name) values ('Петров Петр Петрович');
insert into example.users (name) values ('Егоров Егор Егорович');
-- Запрос к таблице
select * from example.users;