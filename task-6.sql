USE vk;
CREATE DATABASE less;
SELECT * FROM users;
DESCRIBE messages;
/* Написать запросы, используя БД vk-db-data.sql, которые будут решать поставленные задачи:
*  1. Пусть задан некоторый пользователь.
*  Найдите человека, который больше всех общался с нашим пользователем, иначе, кто написал пользователю 
* наибольшее число сообщений. (можете взять пользователя с любым id).*/

SELECT friend_id, count(*) AS count_messages FROM 
	(SELECT txt, to_user_id AS friend_id FROM messages WHERE from_user_id = 11
	 UNION
	 SELECT txt, from_user_id AS friend_id FROM messages WHERE to_user_id = 11) AS virtual_table
GROUP BY friend_id
ORDER BY count_messages DESC
LIMIT 1;

/*  2. Подсчитать общее количество лайков на посты, которые получили пользователи младше 18 лет.*/

SELECT SUM(likes) 
FROM (SELECT COUNT(*) AS likes
	  FROM posts_likes, profiles
	  WHERE posts_likes.user_id = profiles.user_id AND TIMESTAMPDIFF (YEAR, profiles.birthday, NOW()) < 18
	  GROUP BY posts_likes.user_id) AS count_likes;
	 
/*  3. Определить, кто больше поставил лайков (всего) - мужчины или женщины?*/

SELECT COUNT(*) AS likes, gender FROM posts_likes, profiles
WHERE posts_likes.user_id = profiles.user_id AND (profiles.gender = 'm' OR profiles.gender = 'f')
GROUP BY gender
ORDER BY likes DESC
LIMIT 1;

/*  4. (по желанию) Найти пользователя, который проявляет наименьшую активность в использовании социальной сети. */

SELECT id, SUM(points) as points FROM 
	(SELECT id, NULL as points FROM users
	UNION
	SELECT user_id as id, count(*) as acts FROM media
	GROUP BY user_id
	UNION
	SELECT user_id, COUNT(*) FROM posts_likes
	GROUP BY user_id
	UNION
	SELECT user_id, COUNT(*) FROM posts
	GROUP BY user_id
	UNION
	SELECT from_user_id, COUNT(*) FROM messages
	GROUP BY from_user_id) AS activities
GROUP BY id
ORDER BY points
LIMIT 1;
