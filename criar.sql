DROP TABLE IF EXISTS FichaJogo;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Epoca;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Campeonato;
DROP TABLE IF EXISTS Regular;
DROP TABLE IF EXISTS Playoff;
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS Substituicao;
DROP TABLE IF EXISTS Golo;
DROP TABLE IF EXISTS Cartao;
CREATE TABLE Jogador(
    JogadorId INT,
    PRIMARY KEY (JogadorId)
);
CREATE TABLE Clube(ClubeId INT, PRIMARY KEY (ClubeId));
CREATE TABLE Epoca(EpocaId INT, PRIMARY KEY (EpocaId));
CREATE TABLE Equipa(
    EquipaId INT,
    JOGADOR INT,
    EPOCA INT,
    CLUBE INT,
    PRIMARY KEY (EquipaId),
    FOREIGN KEY (JOGADOR) REFERENCES Jogador(JogadorId),
    FOREIGN KEY (EPOCA) REFERENCES Epoca(EpocaId),
    FOREIGN KEY (CLUBE) REFERENCES Clube(ClubeId)
);
CREATE TABLE Campeonato(
    CampeonatoId INT,
    EPOCA INT,
    PRIMARY KEY (CampeonatoId),
    FOREIGN KEY (EPOCA) REFERENCES Epoca(EpocaId)
);
CREATE TABLE Jogo(
    JogoId INT,
    VISITANTE INT,
    VISITADA INT,
    CAMPEONATO INT,
    PRIMARY KEY (JogoId),
    FOREIGN KEY (VISITANTE) REFERENCES Equipa(EquipaId),
    FOREIGN KEY (VISITADA) REFERENCES Equipa(EquipaId),
    FOREIGN KEY (CAMPEONATO) REFERENCES Campeonato(CampeonatoId)
);
CREATE TABLE FichaJogo(
    FichaJogoId INT,
    JOGO INT,
    JOGADOR INT,
    PRIMARY KEY (FichaJogoId),
    FOREIGN KEY (JOGO) REFERENCES Jogo(JogoId),
    FOREIGN KEY (JOGADOR) REFERENCES Jogador(JogadorId)
);
CREATE TABLE Regular(
    RegularId INT,
    CAMPEONATO INT,
    PRIMARY KEY (RegularId),
    FOREIGN KEY (CAMPEONATO) REFERENCES Campeonato(CampeonatoId)
);
CREATE TABLE Playoff(
    PlayoffId INT,
    CAMPEONATO INT,
    PRIMARY KEY (PlayoffId),
    FOREIGN KEY (CAMPEONATO) REFERENCES Campeonato(CampeonatoId)
);
CREATE TABLE Evento(
    EventoId INT,
    JOGO INT,
    PRIMARY KEY (EventoId),
    FOREIGN KEY (JOGO) REFERENCES Jogo(JogoId)
);
CREATE TABLE Substituicao(
    SubstituicaoId INT,
    EVENTO INT,
    PRIMARY KEY (SubstituicaoId),
    FOREIGN KEY (EVENTO) REFERENCES Evento(SubstituicaoId)
);
CREATE TABLE Golo(
    GoloId INT,
    EVENTO INT,
    PRIMARY KEY (GoloId),
    FOREIGN KEY (EVENTO) REFERENCES Evento(EventoId)
);
CREATE TABLE Cartao(
    CartaoId INT,
    EVENTO INT,
    PRIMARY KEY (CartaoId),
    FOREIGN KEY (EVENTO) REFERENCES Evento(CartaoId)
);