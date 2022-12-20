-- Qual é o pavilhão onde houve mais golos?

SELECT Pavilhao.nome AS 'Pavilhão', COUNT(Golo.eventoID) AS 'Nº de Golos'
FROM Golo, Evento, Jogo, Pavilhao
WHERE Golo.eventoID = Evento.ID AND Evento.jogoID = Jogo.ID  AND Jogo.pavilhaoID = Pavilhao.ID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
