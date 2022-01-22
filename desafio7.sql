SELECT 
	Art.`name` AS 'artista', 
  Alb.album_name AS 'album', 
  COUNT(F.`user`) AS 'seguidores' 
FROM SpotifyClone.artists AS Art 
INNER JOIN SpotifyClone.albums AS Alb 
ON Art.artist_id = Alb.artist 
INNER JOIN SpotifyClone.artists_followers AS F
ON Alb.artist = F.artist 
GROUP BY Alb.album_name, Art.`name` 
ORDER BY COUNT(F.`user`) 
DESC, Art.`name`, Alb.album_name;