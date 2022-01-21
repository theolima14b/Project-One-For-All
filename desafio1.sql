DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `SpotifyClone`.`plans` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(125) NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`plan_id`)) 
  ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(125) NOT NULL,
  `age` INT NOT NULL,
  `purchased_plan` INT NOT NULL,
  `signature_date` DATE NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_users_plans`
    FOREIGN KEY (`purchased_plan`)
    REFERENCES `SpotifyClone`.`plans` (`plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
    ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`artists` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`artist_id`)) 
  ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`artists_followers` (
  `user` INT NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`user`, `artist`),
  CONSTRAINT `fk_artists_followers_users`
    FOREIGN KEY (`user`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artists_followers_artists`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
    ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`albums` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(125) NOT NULL,
  `artist` INT NOT NULL,
  `release_date` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_albums_artists`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
    ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`musics` (
  `music_id` INT NOT NULL AUTO_INCREMENT,
  `music_name` VARCHAR(125) NOT NULL,
  `duration_seconds` INT NOT NULL,
  `album` INT NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`music_id`),
  CONSTRAINT `fk_musics_albums`
    FOREIGN KEY (`album`)
    REFERENCES `SpotifyClone`.`albums` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musics_artits`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
    ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`history` (
  `user` INT NOT NULL,
  `music` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  PRIMARY KEY (`user`, `music`),
  CONSTRAINT `fk_history_users`
    FOREIGN KEY (`user`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_musics`
    FOREIGN KEY (`music`)
    REFERENCES `SpotifyClone`.`musics` (`music_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
    ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (`type`, `price`)
  VALUES
    ('gratuito', '0'),
    ('universitario', '5.99'),
    ('pessoal', '6.99'),
    ('familiar', '7.99');

INSERT INTO SpotifyClone.artists (`name`)
  VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

INSERT INTO SpotifyClone.users (`name`, age, purchased_plan, signature_date)
  VALUES
    ('Thati', 23, 1, '2019-10-20'),
    ('Cintia', 35, 4, '2017-12-30'),
    ('Bill', 20, 2, '2019-06-05'),
    ('Roger', 45, 3, '2020-05-13'),
    ('Norman', 58, 3, '2017-02-17'),
    ('Patrick', 33, 4, '2017-01-06'),
    ('Vivian', 26, 2, '2018-01-05'),
    ('Carol', 19, 2, '2018-02-14'),
    ('Angelina', 42, 4, '2018-04-29'),
    ('Paul', 46, 4, '2017-01-17');

INSERT INTO SpotifyClone.albums (album_name, artist, release_date)
  VALUES
    ('Envious', 1, '1990'),
    ('Exuberant', 1, '1993'),
    ('Hallowed Steam', 2, '1995'),
    ('Incandescent', 3, '1998'),
    ('Temporary Culture', 4, '2001'),
    ('Library of liberty', 4, '2003'),
    ('Chained Down', 5, '2007'),
    ('Cabinet of fools', 5, '2012'),
    ('No guarantees', 5, '2015'),
    ('Apparatus', 6, '2015');

INSERT INTO SpotifyClone.artists_followers (`user`, artist)
  VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);

INSERT INTO SpotifyClone.musics (music_name, duration_seconds, artist, album)
    VALUES
      ('Soul For Us', 200, 1, 1),
      ('Reflections Of Magic', 163, 1, 1),
      ('Dance With Her Own', 116, 1, 1),
      ('Troubles Of My Inner Fire', 203, 1, 2),
      ('Time Fireworks', 152, 1, 2),
      ('Magic Circus', 105, 2, 3),
      ('Honey, So Do I', 207, 2, 3),
      ("Sweetle, Let's Go Wild", 139, 2, 3),
      ('She Knows', 244, 2, 3),
      ('Fantasy For Me', 100, 3, 4),
      ('Celebration Of More', 146, 3, 4),
      ('Rock His Everything', 223, 3, 4),
      ('Home Forever', 231, 3, 4),
      ('Diamond Power', 241, 3, 4),
      ("Let's Be Silly", 132, 3, 4),
      ('Thang Of Thunder', 240, 4, 5),
      ('Words Of Her Life', 185, 4, 5),
      ('Without My Streets', 176, 4, 5),
      ('Need Of The Evening', 190, 4, 6),
      ('History Of My Roses', 222, 4, 6),
      ('Without My Love', 111, 4, 6),
      ('Walking And Game', 123, 4, 6),
      ('Young And Father', 197, 4, 6),
      ('Finding My Traditions', 179, 5, 7),
      ('Walking And Man', 229, 5, 7),
      ('Hard And Time', 135, 5, 7),
      ("Honey, I'm A Lone Wolf", 150, 5, 7),
      ("She Thinks I Won't Stay Tonight", 166, 5, 8),
      ("He Heard You're Bad For Me", 154, 5, 8),
      ("He Hopes We Can't Stay", 210, 5, 8),
      ('I Know I Know', 117, 5, 8),
      ("He's Walking Away", 159, 5, 9),
      ("He's Trouble", 138, 5, 9),
      ('I Heard I Want To Bo Alone', 120, 5, 9),
      ('I Ride Alone', 151, 5, 9),
      ('Honey', 79, 6, 10),
      ('You Cheated On Me', 95, 6, 10),
      ("Wouldn't It Be Nice", 213, 6, 10),
      ('Baby', 136, 6, 10),
      ('You Make Me Feel So..', 83, 6, 10);

INSERT INTO SpotifyClone.history (`user`, date_time, music)
	VALUES
		(1, '2020-02-28 10:45:55', 36),
		(1, '2020-05-02 05:30:35', 25),
		(1, '2020-03-06 11:22:33', 23),
		(1, '2020-08-05 08:05:17', 14),
		(1, '2020-09-14 16:32:22', 15),
		(2, '2020-01-02 07:40:33', 34),
		(2, '2020-05-16 06:16:22', 24),
		(2, '2020-10-09 12:27:48', 21),
		(2, '2020-09-21 13:14:46', 39),
		(3, '2020-11-13 16:55:13', 6),
		(3, '2020-12-05 18:38:30', 3),
		(3, '2020-07-30 10:00:00', 26),
		(4, '2021-08-15 17:10:10', 2),
		(4, '2021-07-10 15:20:30', 35),
		(4, '2021-01-09 01:44:33', 27),
		(5, '2020-07-03 19:33:28', 7),
		(5, '2017-02-24 21:14:22', 12),
		(5, '2020-08-06 15:23:43', 14),
		(5, '2020-11-10 13:52:27', 1),
		(6, '2019-02-07 20:33:48', 38),
		(6, '2017-01-24 00:31:17', 29),
		(6, '2017-10-12 12:35:20', 30),
		(6, '2018-05-29 14:56:41', 22),
		(7, '2018-05-09 22:30:49', 5),
		(7, '2020-07-27 12:52:58', 4),
		(7, '2018-01-16 18:40:43', 11),
		(8, '2018-03-21 16:56:40', 39),
		(8, '2020-10-18 13:38:05', 40),
		(8, '2019-05-25 08:14:03', 32),
		(8, '2021-08-15 21:37:09', 33),
		(9, '2021-05-24 17:23:45', 16),
		(9, '2018-12-07 22:48:52', 17),
		(9, '2021-03-14 06:14:26', 8),
		(9, '2020-04-01 03:36:00', 9),
		(10, '2017-02-06 08:21:34', 20),
		(10, '2017-12-04 05:33:43', 21),
		(10, '2017-07-27 05:24:49', 12),
		(10, '2017-12-25 01:03:57', 13);
    