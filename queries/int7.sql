--Qual o jogador espanhol com mais golos no campeonato?

.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT Pessoa.nome AS 'Nome', COUNT(*) AS 'Nº de Golos'
FROM Jogador, Pessoa, Evento, Golo
WHERE Jogador.pessoaID = Pessoa.ID 
AND Golo.eventoID = Evento.ID 
AND Golo.jogadorID = Jogador.pessoaID
AND Jogador.nacionalidade = "espanhola"
GROUP BY 1
limit 1;
