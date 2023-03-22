CREATE TABLE item (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre varchar(100),
  author varchar(100),
  label varchar(100),
  publish_date date,
  archived boolean,
);

-- MusicAlbum Class --

CREATE TABLE music_album (
  id SERIAL PRIMARY KEY,
  item_id int FOREIGN KEY REFERENCES item(id),
  on_spotify boolean,
  publish_date date,
  archived boolean,
);

-- Genre class table --

CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  item_id int FOREIGN KEY REFERENCES item(id),
  name varchar
);