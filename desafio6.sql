SELECT 
	MIN(P.price) AS 'faturamento_minimo', 
  MAX(P.price) AS 'faturamento_maximo', 
  ROUND(AVG(P.price), 2) AS 'faturamento_medio', 
  ROUND(SUM(P.price), 2) AS 'faturamento_total' 
FROM SpotifyClone.users AS U 
INNER JOIN SpotifyClone.plans AS P 
	ON U.purchased_plan = P.plan_id;