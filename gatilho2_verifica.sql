.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Pontos da Equipa com ID = 3 antes de vencer um jogo:'
.print ''

SELECT Equipa.pontos as 'Pontos do campeonato'
FROM Equipa
WHERE Equipa.ID = 3;

INSERT INTO Jogo VALUES(700,2,3,3,1,1,3000,'2021-03-16 20:30:00', '2021-03-16 22:05:00', 'jornada');

.print ''
.print 'Pontos da Equipa com ID = 3 depois de vencer um jogo:'
.print ''

SELECT Equipa.pontos as 'Pontos do campeonato'
FROM Equipa
WHERE Equipa.ID = 3;