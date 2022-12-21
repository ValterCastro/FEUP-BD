.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''

SELECT count (*) as 'Numero de Jogadores com idade menor que 18'
FROM Jogador
WHERE Jogador.idade < 18;

.print ''
.print 'Verificamos que nao existe nenhum Jogador com idade menor que 18.'
.print ''
.print 'Criacao de um Jogador com idade menor que 18'
.print ''

INSERT INTO Jogador VALUES(700,3,1,'argentina',17);

.print ''

SELECT count (*) as 'Numero de Jogadores com idade menor que 18'
FROM Jogador
WHERE Jogador.idade < 18;
