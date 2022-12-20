CREATE TRIGGER IF NOT EXISTS IdadeJogador
    BEFORE INSERT ON Jogador
    BEGIN 
    SELECT
    CASE 
    WHEN NEW.idade < 18 THEN
    RAISE (ABORT, 'Invalid age')
    END;
END;

