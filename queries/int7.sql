--Media de golos marcados por jogador?

.mode columns
.headers on
.nullvalue NULL


SELECT ROUND(AVG(Golos),2) AS 'Media de golos marcados por jogador'
FROM(
SELECT Pessoa.nome AS 'Jogador', COUNT(*) AS 'Golos'
FROM Jogador, Pessoa, Golo, Evento
WHERE Jogador.pessoaID = Pessoa.ID
AND Golo.eventoID = Evento.ID
AND Golo.jogadorID = Jogador.pessoaID
GROUP BY 1
ORDER BY 2 DESC
)
