.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Equipas antes de remover o clube com id = 2'
.print ''

SELECT Equipa.nome, Equipa.clubeID
FROM Equipa
WHERE Equipa.clubeID = 2;

.print ''
.print 'Equipas apos de remover o clube com id = 2'
.print ''

PRAGMA foreign_keys=off;

DELETE FROM Clube WHERE Clube.ID = 2;

SELECT Equipa.nome, Equipa.clubeID
FROM Equipa
WHERE Equipa.clubeID = 2;

PRAGMA foreign_keys=on;