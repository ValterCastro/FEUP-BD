--Jogadores que marcaram no minimo um golo e que nao tiveram faltas

.mode columns
.headers on
.nullvalue NULL

SELECT Pessoa.nome AS 'Jogadores'
FROM Pessoa NATURAL JOIN 
(SELECT Jogador.pessoaID AS 'jogadorID'
FROM Jogador
WHERE 
EXISTS (
    SELECT
    1
    FROM 
    Golo
    WHERE
    Golo.jogadorID = Jogador.pessoaID
)
AND NOT EXISTS(
    SELECT
    1
    FROM 
    Falta
    WHERE
    Falta.jogadorID = Jogador.pessoaID
)
) as a
WHERE Pessoa.ID = a.jogadorID;