CREATE TRIGGER IF NOT EXISTS AdicionaPontosVencedor
AFTER INSERT ON Jogo
  BEGIN
    UPDATE Equipa
    SET pontos = 3 + (SELECT Equipa.pontos FROM Equipa WHERE Equipa.ID = New.vencedorID)
    WHERE ID = New.vencedorID;
  END;