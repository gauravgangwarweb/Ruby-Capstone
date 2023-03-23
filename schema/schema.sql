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

-- Game class table
CREATE TABLE game (
  id SERIAL PRIMARY KEY ,
  item_id INT FOREIGN KEY REFERENCES item(id),
  multiplayer VARCHAR,
  last_played_at DATE,
  publish_date DATE,
);

-- Author class table
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  first_name VARCHAR,
  last_name VARCHAR
);

-- Create Books table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR,
  cover_state VARCHAR,
  genre_id INT NULL REFERENCES genres(id),
  author_id INT NULL REFERENCES authors(id),
  label_id INT NULL REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Create Labels tables
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  color VARCHAR(150) NOT NULL
);