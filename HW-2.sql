CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL,
	date_create INTEGER,
	CHECK (date_create >= '1970')
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL,
	date_create DATE NOT NULL,
	CHECK (date_create >= '1970')
);

CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS list_artist (
	artist_id SERIAL PRIMARY KEY,
	pseudonym VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS list_track (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration INTEGER CHECK (duration < 600),
	album_id INT REFERENCES album (album_id)
);

CREATE TABLE IF NOT EXISTS Genre_Artist (
	genre_id INT REFERENCES genre (genre_id),
	artist_id INT REFERENCES list_artist (artist_id),
	PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Album_Artist (
	artist_id INT REFERENCES list_artist (artist_id),
	album_id INT REFERENCES album (album_id),
	PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track_Collection (
	track_id INT REFERENCES list_track (track_id),
	collection_id INT REFERENCES collection (collection_id),
	PRIMARY KEY (track_id, collection_id)
);
