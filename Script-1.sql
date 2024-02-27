CREATE TABLE IF NOT EXISTS Musicians (
    musician_id SERIAL PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL PRIMARY KEY,
    title VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Relationship_Musicians_Genre (
    genre_id INTEGER REFERENCES Genres(genre_id),
    musician_id INTEGER REFERENCES Musicians(musician_id),
    CONSTRAINT mus_gen PRIMARY KEY (genre_id, musician_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	title_album VARCHAR(40) NOT NULL,
	year_of_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Relationship_Albums_Musicians (
	album_id INTEGER REFERENCES Albums(album_id),
	musician_id INTEGER REFERENCES Musicians(musician_id),
	CONSTRAINT alb_mus PRIMARY KEY (album_id, musician_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	duration TIME NOT NULL, 
	album_id INTEGER REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	year_of_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Relationship_Collection_Track (
	track_id INTEGER REFERENCES Tracks(track_id),
	collection_id INTEGER REFERENCES Collections(collection_id),
	CONSTRAINT coll_trck PRIMARY KEY (track_id, collection_id)
);
