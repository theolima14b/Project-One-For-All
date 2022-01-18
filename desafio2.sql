SELECT 
	COUNT(music_name) AS 'cancoes', 
	COUNT(DISTINCT artist) AS 'artistas', 
  COUNT(DISTINCT album) AS 'albuns' 
FROM SpotifyClone.musics; 
