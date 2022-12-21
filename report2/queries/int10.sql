-- Qual e o resultado do jogo com id = 2?

.mode columns
.headers on
.nullvalue NULL


SELECT Equipa.nome AS 'Equipas',COUNT(*) 'Golos'
FROM Evento, Golo, Equipa, Jogador, Jogo
WHERE Evento.ID = Golo.eventoID
AND Evento.jogoID = Jogo.ID
AND Jogo.visitanteID = Equipa.ID
AND Jogo.ID = 2
AND Golo.jogadorID = Jogador.pessoaID
AND Jogador.equipaID = Jogo.visitanteID
GROUP BY 1

UNION 

SELECT Equipa.nome ,COUNT(*)
FROM Evento, Golo, Equipa, Jogador, Jogo
WHERE Evento.ID = Golo.eventoID
AND Evento.jogoID = Jogo.ID
AND Jogo.visitadaID = Equipa.ID
AND Jogo.ID = 2
AND Golo.jogadorID = Jogador.pessoaID
AND Jogador.equipaID = Jogo.visitadaID
GROUP BY 1;