-- Used repl and ai to generate data
-- https://replit.com/@math919191/ArtMuseums#main.sql

CREATE TABLE art (
    art_id INT,
    artist VARCHAR(100),
    art_name VARCHAR(100),
    year_created DATETIME,
    country VARCHAR(100),
    material VARCHAR(100),
    min_req_security_level INT
);


CREATE TABLE museum (
    museum_id INT,
    museum_name VARCHAR(100),
    location VARCHAR(100),
    date_opened DATETIME,
    size_of_museum INT,
    security_level INT
);

CREATE TABLE visit (
    visit_id INT,
    time_entry DATETIME,
    time_exit DATETIME,
    visitor_name VARCHAR(100),
    visitor_age VARCHAR(100),
    visitor_gender VARCHAR(100),
    museum_id INT
);


CREATE TABLE exhibit (
  exhibit_id INT,
  start_date DATETIME,
  end_date DATETIME,
  exhibit_name VARCHAR(100),
  max_num_pieces INT,
  size_of_exhibit INT   
);

CREATE TABLE museum_and_exhibit (
  museum_id INT,
  exhibit_id INT
);

CREATE TABLE art_and_exhibit (
  art_id INT,
  exhibit_id INT
);


-- Inserting 3 museums
INSERT INTO museum (museum_id, museum_name, location, date_opened, size_of_museum, security_level)
VALUES 
(1, 'Museum A', 'Location A', '2022-01-01', 500, 3),
(2, 'Museum B', 'Location B', '2022-01-01', 600, 4),
(3, 'Museum C', 'Location C', '2022-01-01', 700, 5);

-- Inserting 9 exhibits (3 for each museum)
INSERT INTO exhibit (exhibit_id, start_date, end_date, exhibit_name, max_num_pieces, size_of_exhibit)
VALUES 
(1, '2022-02-01', '2022-03-01', 'Exhibit 1', 5, 100),
(2, '2022-02-01', '2022-03-01', 'Exhibit 2', 5, 150),
(3, '2022-02-01', '2022-03-01', 'Exhibit 3', 5, 200),
(4, '2022-02-01', '2022-03-01', 'Exhibit 1', 5, 120),
(5, '2022-02-01', '2022-03-01', 'Exhibit 2', 5, 180),
(6, '2022-02-01', '2022-03-01', 'Exhibit 3', 5, 220),
(7, '2022-02-01', '2022-03-01', 'Exhibit 1', 5, 130),
(8, '2022-02-01', '2022-03-01', 'Exhibit 2', 5, 170),
(9, '2022-02-01', '2022-03-01', 'Exhibit 3', 5, 210);

-- Linking museums and exhibits
INSERT INTO museum_and_exhibit (museum_id, exhibit_id)
VALUES 
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5), (2, 6),
(3, 7), (3, 8), (3, 9);

-- Inserting 10 art entries
INSERT INTO art (art_id, artist, art_name, year_created, country, material, min_req_security_level)
VALUES 
(1, 'Vincent van Gogh', 'Irises', '1889-01-01', 'Netherlands', 'Oil on canvas', 5),
(2, 'Édouard Manet', 'Olympia', '1863-01-01', 'France', 'Oil on canvas', 5),
(3, 'Caravaggio', 'David with the Head of Goliath', '1610-01-01', 'Italy', 'Oil on canvas', 5),
(4, 'Diego Velázquez', 'Las Meninas', '1656-01-01', 'Spain', 'Oil on canvas', 5),
(5, 'Rembrandt', 'The Night Watch', '1642-01-01', 'Netherlands', 'Oil on canvas', 5),
(6, 'Edgar Degas', 'LAbsinthe', '1876-01-01', 'France', 'Oil on canvas', 5),
(7, 'Claude Monet', 'Water Lilies', '1916-01-01', 'France', 'Oil on canvas', 5),
(8, 'Raphael', 'The School of Athens', '1509-01-01', 'Italy', 'Fresco', 5),
(9, 'Henri Matisse', 'The Dance', '1910-01-01', 'France', 'Oil on canvas', 5),
(10, 'Auguste Rodin', 'The Thinker', '1902-01-01', 'France', 'Bronze', 5),
(11, 'Leonardo da Vinci', 'The Last Supper', '1495-01-01', 'Italy', 'Fresco', 5),
(12, 'Vincent van Gogh', 'A Wheatfield, with Cypresses', '1889-01-01', 'Netherlands', 'Oil on canvas', 5),
(13, 'Pablo Picasso', 'Guernica', '1937-01-01', 'Spain', 'Oil on canvas', 5),
(14, 'Michelangelo', 'Creation of Adam', '1508-01-01', 'Italy', 'Fresco', 5),
(15, 'Caravaggio', 'The Supper at Emmaus', '1601-01-01', 'Italy', 'Oil on canvas', 5),
(16, 'Rembrandt', 'The Storm on the Sea of Galilee', '1633-01-01', 'Netherlands', 'Oil on canvas', 5),
(17, 'Édouard Manet', 'The Luncheon on the Grass', '1863-01-01', 'France', 'Oil on canvas', 5),
(18, 'Edgar Degas', 'The Tub', '1886-01-01', 'France', 'Oil on canvas', 5),
(19, 'Henri Matisse', 'Woman with a Hat', '1905-01-01', 'France', 'Oil on canvas', 5),
(20, 'Auguste Rodin', 'The Kiss', '1888-01-01', 'France', 'Marble', 5);

-- Inserting art into exhibits
INSERT INTO art_and_exhibit (art_id, exhibit_id)
VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3);

-- Inserting 10 visits
INSERT INTO visit (visit_id, time_entry, time_exit, visitor_name, visitor_age, visitor_gender, museum_id)
VALUES 
(1, '2022-04-01 10:00:00', '2022-04-01 12:00:00', 'John Doe', '25', 'Male', 1),
(2, '2022-04-01 10:15:00', '2022-04-01 12:30:00', 'Jane Smith', '30', 'Female', 1),
(3, '2022-04-02 11:00:00', '2022-04-02 13:00:00', 'Bob Johnson', '40', 'Male', 2),
(4, '2022-04-02 11:30:00', '2022-04-02 13:30:00', 'Sarah Brown', '35', 'Female', 2),
(5, '2022-04-03 12:00:00', '2022-04-03 14:00:00', 'Michael Davis', '28', 'Male', 3),
(6, '2022-04-03 12:15:00', '2022-04-03 14:30:00', 'Emily White', '22', 'Female', 3),
(7, '2022-04-04 13:00:00', '2022-04-04 15:00:00', 'David Lee', '45', 'Male', 1),
(8, '2022-04-04 13:30:00', '2022-04-04 15:30:00', 'Olivia Taylor', '27', 'Female', 1),
(9, '2022-04-05 14:00:00', '2022-04-05 16:00:00', 'James Parker', '32', 'Male', 2),
(10, '2022-04-05 14:45:00', '2022-04-05 16:30:00', 'Lily Martinez', '29', 'Female', 2);
INSERT INTO visit (visit_id, time_entry, time_exit, visitor_name, visitor_age, visitor_gender, museum_id)
VALUES 
(11, '2022-04-06 15:00:00', '2022-04-06 17:00:00', 'Alex Johnson', '15', 'Male', 3),
(12, '2022-04-07 16:00:00', '2022-04-07 18:00:00', 'Emma Williams', '16', 'Female', 2),
(13, '2022-04-08 10:00:00', '2022-04-08 12:00:00', 'Noah Brown', '11', 'Male', 1),
(14, '2022-04-09 12:00:00', '2022-04-09 14:00:00', 'Sophia Davis', '13', 'Female', 3),
(15, '2022-04-10 11:00:00', '2022-04-10 13:00:00', 'William Wilson', '14', 'Male', 1),
(16, '2022-04-11 12:00:00', '2022-04-11 14:00:00', 'Olivia Moore', '12', 'Female', 2),
(17, '2022-04-12 14:00:00', '2022-04-12 16:00:00', 'Ethan Taylor', '10', 'Male', 3),
(18, '2022-04-13 13:00:00', '2022-04-13 15:00:00', 'Ava Anderson', '9', 'Female', 1),
(19, '2022-04-14 11:00:00', '2022-04-14 13:00:00', 'Daniel Thomas', '17', 'Male', 2),
(20, '2022-04-15 10:00:00', '2022-04-15 12:00:00', 'Mia Jackson', '15', 'Female', 3);