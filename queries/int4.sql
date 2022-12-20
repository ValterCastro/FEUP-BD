-- Qual o jogador mais novo que marcou golos nesta epoca?

SELECT Pessoa.nome AS 'Nome', Jogador.idade AS 'Idade', COUNT(Golo.jogadorID) AS 'Nº de Golos'
FROM Jogador, Pessoa, FichaJogo, Jogo, Evento, Golo
WHERE Jogador.pessoaID = Pessoa.ID AND Pessoa.ID = FichaJogo.jogadorID AND FichaJogo.jogoID = Jogo.ID AND Jogo.ID = Evento.jogoID AND Evento.ID = Golo.eventoID
GROUP BY 1
ORDER BY 2 ASC, 3 DESC
LIMIT 1;