CREATE TABLE IF NOT EXISTS jenres (
	id_jenre SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL);

CREATE TABLE IF NOT EXISTS executors (
	id_executor SERIAL PRIMARY KEY,
	name VARCHAR(160) NOT NULL);

CREATE TABLE IF NOT EXISTS albums (
	id_album SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_of_issur DATE);

-- многие ко многим
CREATE TABLE IF NOT EXISTS jenres_executors_albums (
	id_jenre INTEGER REFERENCES jenres(id_jenre),
	id_executor INTEGER REFERENCES executors(id_executor),
	id_album INTEGER REFERENCES albums(id_album),
	CONSTRAINT pk PRIMARY KEY (id_jenre, id_executor, id_album));

-- один ко многим
CREATE TABLE IF NOT EXISTS traks (
	id_traks SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	time numeric,
	id_album INTEGER NOT NULL REFERENCES albums(id_album));

CREATE TABLE IF NOT EXISTS collection (
	id_collection SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year_of_issur DATE);

-- многие ко многим
CREATE TABLE IF NOT EXISTS collection_traks (
	id_traks INTEGER REFERENCES traks(id_traks),
	id_collection INTEGER REFERENCES collection(id_collection),
	CONSTRAINT vk PRIMARY KEY (id_traks, id_collection));
