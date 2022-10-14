DROP TABLE IF EXISTS FichajogoID;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS epocaID;
DROP TABLE IF EXISTS jogoID;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Campeonato;
DROP TABLE IF EXISTS Regular;
DROP TABLE IF EXISTS Playoff;
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS Substituicao;
DROP TABLE IF EXISTS Golo;
DROP TABLE IF EXISTS Cartao;
CREATE TABLE Jogador(
    ID INT,
    PRIMARY KEY (ID)
);
CREATE TABLE Clube(ID INT, PRIMARY KEY (ID));
CREATE TABLE Epoca(ID INT, PRIMARY KEY (ID));
CREATE TABLE Equipa(
    ID INT,
    jogadorID INT,
    epocaID INT,
    clubeID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID),
    FOREIGN KEY (clubeID) REFERENCES Clube(ID)
);
CREATE TABLE Campeonato(
    ID INT,
    epocaID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID)
);
CREATE TABLE Jogo(
    ID INT,
    visitanteID INT,
    visitadaID INT,
    campeonatoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (visitanteID) REFERENCES Equipa(ID),
    FOREIGN KEY (visitadaID) REFERENCES Equipa(ID),
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID)
);
CREATE TABLE FichaJogo(
    ID INT,
    jogoID INT,
    jogadorID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(ID)
);
CREATE TABLE Regular(
    ID INT,
    campeonatoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID)
);
CREATE TABLE Playoff(
    ID INT,
    campeonatoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID)
);
CREATE TABLE Evento(
    ID INT,
    jogoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID)
);
CREATE TABLE Substituicao(
    ID INT,
    eventoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID)
);
CREATE TABLE Golo(
    ID INT,
    eventoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID)
);
CREATE TABLE Cartao(
    ID INT,
    eventoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID)
);