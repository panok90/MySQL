/* 1. Подсчитайте средний возраст пользователей в таблице users. */

SELECT ROUND( AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())), 0) AS age FROM users;

/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

SELECT 
	DATE_FORMAT(DATE(CONCAT(YEAR(NOW()), '-',  MONTH(birthday), '-',  DAY(birthday))), '%W') AS day_of_the_week, COUNT(*) AS total 
FROM 
	profiles 
GROUP BY 
	day_of_the_week 
ORDER BY 
	total DESC;

/* 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы */
SELECT ROUND(exp(SUM(log(value))), 0) AS factorial FROM integers;
