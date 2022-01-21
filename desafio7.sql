SELECT 
	Art.`name` AS 'artista', 
  Alb.album_name AS 'album', 
  COUNT(Fol.`user`) AS 'seguidores' 
FROM SpotifyClone.artists AS Art 
INNER JOIN SpotifyClone.albums AS Alb 
	ON Art.artist_id = Alb.artist 
INNER JOIN SpotifyClone.artists_followers AS Fol
	ON Alb.artist = Fol.artist 
GROUP BY Alb.album_name, Art.`name` 
ORDER BY COUNT(Fol.`user`) DESC, Art.`name`, Alb.album_name;