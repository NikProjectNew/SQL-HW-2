create TABLE IF NOT exists album (
	album_id SERIAL primary key,
	name VARCHAR(100) unique not null,
	date_create date not null
);
create TABLE IF NOT exists  collection (
	collection_id SERIAL primary key,
	name VARCHAR(100) unique not null,
	date_create date not null
); 
create TABLE IF NOT exists  genre (
	genre_id SERIAL primary key,
	name VARCHAR(100) unique not null
); 
create TABLE IF NOT exists  list_artist (
	artist_id SERIAL primary key,
	pseudonym VARCHAR(100) unique not null
); 
create TABLE IF NOT exists  list_track (
	track_id SERIAL primary key,
	name VARCHAR(100) not null,
	duration integer
);
create TABLE IF NOT exists Genre_Artist (
  genre_id INT references genre (genre_id),
  artist_id INT references list_artist (artist_id),
  primary key (genre_id, artist_id)
);
create TABLE IF NOT exists Album_Artist (
  artist_id INT references list_artist (artist_id),
  album_id INT references album (album_id),
  primary key (artist_id, album_id)
);
create TABLE IF NOT exists Track_Collection (
  track_id INT references list_track (track_id),
  collection_id INT references collection (collection_id),
  primary key (track_id, collection_id)
);
	