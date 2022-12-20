CREATE TRIGGER gatilho1_adiciona
    BEFORE INSERT ON Jogador
    BEGIN 
    SELECT
    CASE 
    WHEN NEW.idade < 18 THEN
    RAISE (ABORT, 'Invalid age')
    END;
END;

INSERT INTO Jogador VALUES(700,3,1,'argentina',17);