-- Qual é o top 10 de jogadores que marcaram mais golos?

SELECT Pessoa.nome AS 'Nome', COUNT(Golo.eventoID) AS 'Nº de Golos'
FROM Pessoa, Golo, Jogo, Evento, FichaJogo
WHERE Golo.eventoID = Evento.ID AND Evento.jogoID = Jogo.ID AND Jogo.ID = FichaJogo.jogoID AND FichaJogo.jogadorID = Pessoa.ID
GROUP BY Pessoa.nome
ORDER BY 2 DESC
LIMIT 10;

