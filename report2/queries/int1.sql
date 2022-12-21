-- Qual é o top 10 de jogadores que marcaram mais golos?

.mode columns
.headers on
.nullvalue NULL

SELECT Pessoa.nome AS 'Jogador', COUNT(*) AS 'Golos'
FROM Jogador, Pessoa, Golo, Evento
WHERE Jogador.pessoaID = Pessoa.ID
AND Golo.eventoID = Evento.ID
AND Golo.jogadorID = Jogador.pessoaID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;