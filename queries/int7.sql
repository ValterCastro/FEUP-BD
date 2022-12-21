--Qual o jogador italiano com mais golos no campeonato?

.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT Pessoa.nome AS 'Nome', COUNT(Golo.jogadorID) AS 'Nº de Golos'
FROM Jogador, Pessoa, FichaJogo, Jogo, Evento, Golo
WHERE Jogador.pessoaID = Pessoa.ID AND Pessoa.ID = FichaJogo.jogadorID AND FichaJogo.jogoID = Jogo.ID AND Jogo.ID = Evento.jogoID AND Evento.ID = Golo.eventoID AND Jogador.nacionalidade = "italiana"
GROUP BY 1;
