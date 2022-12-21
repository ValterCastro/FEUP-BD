-- Quantos eventos houve no jogo com id = 1?


.mode columns
.headers on
.nullvalue NULL



SELECT Jogo.ID AS 'Jogo ID', COUNT(Evento.jogoID) AS 'Eventos'
FROM Jogo , Evento
WHERE Jogo.ID = Evento.jogoID
GROUP BY 1
HAVING Evento.jogoID = 1;