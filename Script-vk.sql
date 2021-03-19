USE vk;
DROP TABLE IF EXISTS articles;
CREATE TABLE articles( -- посты пользователя
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Ключ
	user_id BIGINT UNSIGNED NOT NULL, 
	media_id BIGINT UNSIGNED NOT NULL, 
	txt TEXT NOT NULL, -- текст поста
	INDEX fk_articles_users_idx (user_id), -- индексируем по пользователю
	CONSTRAINT fk_aticles_media FOREIGN KEY (media_id) REFERENCES media (id), -- Ссылка на медиа
	CONSTRAINT fk_articles_users FOREIGN KEY (user_id) REFERENCES users (id) -- Ссылка на пользователя
) ENGINE=InnoDB;

-- лайки пользователей медиа
DROP TABLE IF EXISTS media_likes;
CREATE TABLE media_likes (
	media_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, media_id),
	fixed_like BOOLEAN DEFAULT False, -- фиксируем лайк
	fixed_dislike BOOLEAN DEFAULT False, -- дизлайк
	INDEX fk_media_likes_media_idx (media_id), -- индексируем по медиа
	CONSTRAINT fk_media_likes_media FOREIGN KEY (media_id) REFERENCES media (id), -- Ссылка на медиа
	CONSTRAINT fk_media_likes_users FOREIGN KEY (user_id) REFERENCES users (id) -- Ссылка на пользователя
) ENGINE=InnoDB;

-- лайки пользователей постов
DROP TABLE IF EXISTS articles_likes;
CREATE TABLE articles_likes ( 
	article_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (article_id, user_id),
	fixed_like BOOLEAN DEFAULT False, -- фиксируем лайк
	fixed_dislike BOOLEAN DEFAULT False, -- дизлайк
	INDEX fk_articles_likes_media_idx (article_id), -- индексируем по постам
	CONSTRAINT fk_articles_likes_articles FOREIGN KEY (article_id) REFERENCES articles (id), -- Ссылка на медиа
	CONSTRAINT fk_articles_likes_users FOREIGN KEY (user_id) REFERENCES users (id) -- Ссылка на пользователя
) ENGINE=InnoDB;

SHOW tables;