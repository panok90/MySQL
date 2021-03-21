USE vk;

UPDATE media_types SET name = 'фото' WHERE id=1;
UPDATE media_types SET name = 'Видео' WHERE id=2;
UPDATE media_types SET name = 'Музыка' WHERE id=3;
UPDATE media_types SET name = 'Картинка' WHERE id=4;

SELECT * FROM media_types;