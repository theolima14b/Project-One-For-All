SELECT 
	M.music_name AS 'nome', 
	COUNT(H.`user`) AS 'reproducoes' 
FROM SpotifyClone.musics AS M 
INNER JOIN SpotifyClone.history AS H 
	ON M.music_id = H.music 
INNER JOIN SpotifyClone.users AS U 
	ON H.`user` = U.user_id 
WHERE U.purchased_plan = 1 OR U.purchased_plan = 3 
GROUP BY M.music_name 
ORDER BY M.music_name;