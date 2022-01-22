SELECT 
	Art.`name` AS 'artista', 
  Alb.album_name AS 'album' 
FROM SpotifyClone.artists AS Art 
INNER JOIN SpotifyClone.albums AS Alb 
ON Art.artist_id = Alb.artist 
WHERE Art.`name` LIKE 'Walter Phoenix' 
ORDER BY Alb.album_name;