CREATE TABLE IF NOT EXISTS jenres (
	id_jenre SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null UNIQUE);
	
CREATE TABLE IF NOT EXISTS executors (
	id_executor SERIAL PRIMARY KEY,
	name VARCHAR(160) NOT NULL);
	
CREATE TABLE IF NOT EXISTS albums (
	id_album SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	year_of_issur DATE check(year_of_issur >= '2018-01-01'),
	unique(year_of_issur));

--удаление данных столбца из таблицы.
 ALTER TABLE albums DROP COLUMN year_of_issur;

--удаление строки в тавлице по id.
DELETE FROM albums WHERE id_album = 12;
 
--изменение типа данных в таблице.
ALTER TABLE albums ADD COLUMN year_of_issur integer;

--изменение типа ограничения в столбце.
ALTER TABLE albums ALTER COLUMN year_of_issur SET NOT NULL;

	
CREATE TABLE IF NOT EXISTS jenres_executors_albums (
	id_jenre INTEGER REFERENCES jenres(id_jenre),
	id_executor INTEGER REFERENCES executors(id_executor),
	CONSTRAINT pk1_id PRIMARY KEY (id_jenre, id_executor));

--переименование таблици.
ALTER TABLE jenres_executors_albums RENAME TO jenres_executors;
	
CREATE TABLE IF NOT EXISTS executors_albums (
	id_executor INTEGER REFERENCES executors(id_executor),
	id_album INTEGER REFERENCES albums(id_album),
	CONSTRAINT pk2_id PRIMARY KEY (id_executor, id_album));
	
CREATE TABLE IF NOT EXISTS traks (
	id_trak SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT null,
	time_trak INTEGER,
	id_album INTEGER NOT NULL REFERENCES albums(id_album));
	
CREATE TABLE IF NOT EXISTS collection (
	id_collection SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year_of_issur DATE UNIQUE,
	check(year_of_issur >= '2018-01-01'));
	
CREATE TABLE IF NOT EXISTS collection_traks (
	id_trak INTEGER REFERENCES traks(id_trak),
	id_collection INTEGER REFERENCES collection(id_collection),
	CONSTRAINT vk PRIMARY KEY (id_trak, id_collection));
	



