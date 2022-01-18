SELECT 
	M.music_name AS 'cancao', 
  COUNT(H.music) AS 'reproducoes' 
FROM SpotifyClone.listening_history AS H
INNER JOIN SpotifyClone.musics AS M
	ON H.music = M.music_id 
GROUP BY H.music
ORDER BY COUNT(H.music) DESC, M.music_name
LIMIT 2; 