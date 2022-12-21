-- Qual o golo mais tardio da equipa que marcou mais golos?


SELECT EquipaComMaisGolos, NumeroDeGolos, a.tempo AS 'GoloMaisTardio'
FROM 
(SELECT Equipa.nome AS 'EquipaComMaisGolos', COUNT(*) AS 'NumeroDeGolos', Evento.ID AS 'golosa', Evento.tempo AS 'tempo'
FROM Equipa, Evento, Golo, Jogador
WHERE Evento.ID = Golo.eventoID
AND Jogador.pessoaID = Golo.jogadorID
AND Jogador.equipaID = Equipa.ID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1) as a, Golo
WHERE a.golosa = Golo.eventoID
ORDER BY 3 DESC
LIMIT 1;