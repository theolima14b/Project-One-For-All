SELECT 
	U.`name` AS 'usuario', 
  COUNT(H.`user`) AS 'qtde_musicas_ouvidas', 
  ROUND(SUM(M.duration_seconds) / 60, 2) AS 'total_minutos' 
FROM SpotifyClone.users AS U 
INNER JOIN SpotifyClone.history AS H 
	ON U.user_id = H.`user` 
INNER JOIN SpotifyClone.musics AS M 
	ON H.music = M.music_id 
GROUP BY H.`user` 
ORDER BY U.`name`;