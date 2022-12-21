-- Qual o golo mais tardio da equipa que marcou mais golos?


SELECT  EquipaComMaisGolos, NumeroDeGolos, Evento.tempo AS 'GoloMaisTardio'
FROM Equipa, Evento, Golo, Jogador,
(SELECT Equipa.nome AS 'EquipaComMaisGolos', COUNT(*) AS 'NumeroDeGolos'
FROM Equipa, Evento, Golo, Jogador
WHERE Evento.ID = Golo.eventoID
AND Jogador.pessoaID = Golo.jogadorID
AND Jogador.equipaID = Equipa.ID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
) as a
WHERE Evento.ID = Golo.eventoID
AND Jogador.pessoaID = Golo.jogadorID
AND Jogador.equipaID = Equipa.ID
AND Equipa.nome = EquipaComMaisGolos
ORDER BY 3 DESC
LIMIT 1;

