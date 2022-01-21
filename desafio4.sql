SELECT 
	U.`name` AS 'usuario', 
  IF (MAX(YEAR (H.date_time)) = 2021, 'Usuário ativo', 'Usuário inativo') AS 'condicao_usuario' 
FROM SpotifyClone.users AS U 
INNER JOIN SpotifyClone.listening_history AS H 
	ON U.user_id = H.`user` 
GROUP BY U.`name` 
ORDER BY U.`name`;