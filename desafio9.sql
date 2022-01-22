SELECT COUNT(H.`user`) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.listening_history AS H 
INNER JOIN SpotifyClone.users AS U
ON H.`user` = U.user_id
WHERE U.`name` LIKE 'Bill';