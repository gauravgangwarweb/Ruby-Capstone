-- Create Item table
CREATE TABLE item (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre text,
  author text,
  label text,
  publish_date date,
  archived boolean,
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