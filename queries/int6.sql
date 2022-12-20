-- Quais são os jogadores da equipa Sporting CP?

SELECT DISTINCT Pessoa.nome AS 'Nome', FichaJogo.numeroCamisola AS 'Nº da Camisola'
FROM Jogador, Pessoa, FichaJogo
WHERE Jogador.pessoaID = Pessoa.ID AND FichaJogo.jogadorID = Pessoa.ID AND Jogador.equipaID = 2;
