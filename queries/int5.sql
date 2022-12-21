-- De que nacionalidade é o jogador com mais faltas?

.mode columns
.headers on
.nullvalue NULL

SELECT Pessoa.nome AS 'Jogador', Jogador.nacionalidade AS 'Nacionalidade',COUNT(*) AS 'Faltas'
FROM Pessoa, Jogador, Evento, Falta
WHERE Pessoa.ID = Jogador.pessoaID
AND Evento.ID = Falta.eventoID
AND Falta.jogadorID = Jogador.pessoaID
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1;