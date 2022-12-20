-- De que nacionalidade é o jogador com mais faltas?

SELECT Pessoa.nome AS 'Nome', Jogador.nacionalidade AS 'Nacionalidade', COUNT(Falta.gravidade) AS 'Nº de Faltas'
FROM Jogador, Pessoa, FichaJogo, Jogo, Evento, Falta
WHERE Jogador.pessoaID = Pessoa.ID AND Pessoa.ID = FichaJogo.jogadorID AND FichaJogo.jogoID = Jogo.ID AND Jogo.ID = Evento.jogoID AND Evento.ID = Falta.eventoID
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1;
