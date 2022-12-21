--Qual o clube com mais faltas?


.mode columns
.headers on
.nullvalue NULL

SELECT Clube.nome AS 'Clube', COUNT(*) AS 'Faltas'
FROM Clube, Equipa, Falta, Evento, Jogador
WHERE Equipa.clubeID = Clube.ID
AND Evento.ID = Falta.eventoID
AND Jogador.pessoaID = Falta.jogadorID
AND Jogador.equipaID = Equipa.ID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;