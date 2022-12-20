-- Quantas vezes um arbitro apitou um x clube?

SELECT Clube.nome AS 'Nome do Clube', COUNT(Falta.gravidade) AS 'Nº de Faltas'
FROM Jogo, Evento, Falta, Campeonato, Epoca, Equipa, Clube
WHERE Falta.eventoID = Evento.ID AND Evento.jogoID = Jogo.ID AND Jogo.campeonatoID = Campeonato.ID AND Campeonato.epocaID = Epoca.ID AND Epoca.ID = Equipa.epocaID AND Equipa.clubeID = Clube.ID AND Clube.nome = "FC Porto"
GROUP BY 1;