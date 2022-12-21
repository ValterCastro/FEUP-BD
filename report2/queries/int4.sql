-- Quais os jogadores mais novos que marcaram golos nesta epoca?

.mode columns
.headers on
.nullvalue NULL

SELECT Pessoa.nome AS 'Nome', Jogador.idade AS 'Idade', COUNT(*) AS 'Nº de Golos'
FROM Jogador, Pessoa, Evento, Golo
WHERE Jogador.pessoaID = Pessoa.ID 
AND Golo.eventoID = Evento.ID
AND Golo.jogadorID = Jogador.pessoaID
GROUP BY 1
ORDER BY 2 ASC, 3 DESC
LIMIT 1;