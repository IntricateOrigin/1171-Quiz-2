DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;


CREATE TABLE albums (
    album_id serial PRIMARY KEY,
    title TEXT NOT NULL,
    artist TEXT NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW ()
);

CREATE TABLE tracks (
    track_id serial PRIMARY KEY,
    title TEXT NOT NULL,
    length TIME NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW ()

);

CREATE TABLE albums_tracks (
    album_track_id serial PRIMARY KEY,
    album_id INTEGER REFERENCES albums(album_id),
    track_id INTEGER REFERENCES tracks(track_id),
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW ()

);

INSERT INTO albums (title, artist)
VALUES ('Graduation', 'Kanye West'),
('Invincible', 'Michael Jackson'),
('Off the Wall', 'Michael Jackson'),
('Word Sound and Power', 'Christafari'),
('Chronologic', 'Caravan Palace'),
('good kid, m.A.A.d city', 'Kendrick Lamar'),
('Unorthodox Jukebox', 'Bruno Mars'),
('Vices & Virtues', 'Panic! At The Disco'),
('My Beautiful Dark Twisted Fantasy', 'Kanye West'),
('Pretty. Odd.', 'Panic! At The Disco');

INSERT INTO tracks (title, length)
VALUES ('Good Morning', TIME '00:03:15'),
('I Wonder', TIME '00:04:03'),
('Butterflies', TIME '00:04:39'),
('Unbreakable', TIME '00:06:25'),
('Rock with you', TIME '00:03:40'),
('Get on the Floor', TIME '00:04:37'),
('Blood and Fire', TIME '00:05:25'),
('My Stereo', TIME '00:05:11'),
('Miracle', TIME '00:03:56'),
('About You', TIME '00:03:48'),
('Money Trees', TIME '00:06:36'),
('Real', TIME '00:07:23'),
('Locked out of Heaven', TIME '00:03:58'),
('Gorilla', TIME '00:04:04'),
('Hurricane', TIME '00:04:25'),
('Always', TIME '00:02:33'),
('All of the Lights', TIME '00:04:25'),
('Monster', TIME '00:06:18'),
('That Green Gentleman', TIME '00:03:15'),
('Nine in the Afternoon', TIME '00:03:11');

INSERT INTO albums_tracks (album_id, track_id)
VALUES (1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20);

/* 5.) 

SELECT A.title AS "Albums",
      T.title AS "Tracks"


FROM albums AS A
INNER JOIN albums_tracks AS A_T
ON A.album_id = A_T.album_id
INNER JOIN tracks AS T
ON A_T.track_id = T.track_id;*/

/* 6.) 

SELECT T.title AS "Tracks",
      A.title AS "Albums"


FROM tracks AS T
INNER JOIN albums_tracks AS A_T
ON T.track_id = A_T.track_id
INNER JOIN albums AS A
ON A_T.album_id = A.album_id; */

/* 7.) 

SELECT A.album_id,
      A.title,
      COUNT(T.track_id) AS num_songs


FROM albums AS A
INNER JOIN albums_tracks AS A_T
ON A.album_id = A_T.album_id
INNER JOIN tracks AS T
ON A_T.track_id = T.track_id


GROUP BY A.album_id, A.title
ORDER BY A.album_id ASC; */

/* 8.) */

SELECT T.track_id,
      T.title,
      COUNT(A.album_id) AS num_albums


FROM tracks AS T
INNER JOIN albums_tracks AS A_T
ON T.track_id = A_T.track_id
INNER JOIN albums AS A
ON A_T.album_id = A.album_id


GROUP BY T.track_id, T.title
ORDER BY T.track_id ASC;


