-- Qual é o tempo fim e tempo início do jogo que teve mais faltas no Pavilhao Casablanca?

SELECT Jogo.ID AS "Jogo ID", REPLACE(Jogo.tempoInicio, '2022-03-05 ', '') AS 'Tempo Início', REPLACE(Jogo.tempoFim, '2022-03-05 ', '') AS 'Tempo Fim', COUNT(Falta.gravidade) AS 'Nº de Faltas'
FROM Falta, Evento, Jogo, Pavilhao
WHERE Falta.eventoID = Evento.ID AND Evento.jogoID = Jogo.ID  AND Jogo.pavilhaoID = Pavilhao.ID AND Pavilhao.nome = "Pavilhao Casablanca"
GROUP BY Jogo.ID;