PRAGMA FOREIGN_KEYS = ON;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Epoca;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Campeonato;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Fichajogo;
DROP TABLE IF EXISTS Regular;
DROP TABLE IF EXISTS Playoff;
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS Golo;
DROP TABLE IF EXISTS Falta;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Cronometrista;
DROP TABLE IF EXISTS TreinadorAdjunto;
DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS DelegadoTecnico;
DROP TABLE IF EXISTS Delegado;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Arbitro;
DROP TABLE IF EXISTS PessoaJogo;
DROP TABLE IF EXISTS Pavilhao;
CREATE TABLE Clube(
    ID INT,
    nome TEXT NOT NULL,
    morada TEXT,
    PRIMARY KEY (ID)
);
CREATE TABLE Epoca(
    ID INT,
    data DATE NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE Equipa(
    ID INT,
    epocaID INT,
    clubeID INT,
    nome TEXT NOT NULL,
    pontos INT DEFAULT '0' CONSTRAINT OutOfBounds CHECK (pontos >= 0 AND pontos <= 72), 
    PRIMARY KEY (ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID),
    FOREIGN KEY (clubeID) REFERENCES Clube(ID)
);
CREATE TABLE Campeonato(
    ID INT,
    epocaID INT,
    divisao TEXT,
    nome TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID)
);
CREATE TABLE Jogo(
    ID INT,
    visitanteID INT,
    visitadaID INT,
    vencedorID INT,
    campeonatoID INT,
    numeroJogo INT,
    tempoInicio SMALLDATETIME NOT NULL CONSTRAINT Tinicialmenorfinal CHECK (tempoInicio < tempoFim),
    tempoFim SMALLDATETIME NOT NULL CONSTRAINT Tfinalmaiorinicial CHECK (tempoFim > tempoInicio),
    categoria TEXT DEFAULT 'jornada' NOT NULL CONSTRAINT CategoriaNome CHECK (
        categoria = 'jornada'
        OR categoria = 'quartos-final'
        OR categoria = 'meia-final'
        OR categoria = 'final'
    ),
    PRIMARY KEY (ID),
    FOREIGN KEY (visitanteID) REFERENCES Equipa(ID),
    FOREIGN KEY (visitadaID) REFERENCES Equipa(ID),
    FOREIGN KEY (vencedorID) REFERENCES Equipa(ID),
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID)

);
CREATE TABLE FichaJogo(
    ID INT,
    jogoID INT,
    jogadorID INT,
    titularidade TEXT DEFAULT 'titular' NOT NULL CONSTRAINT TitularidadeNome CHECK (
        titularidade = 'banco'
        OR titularidade = 'titular'
    ),
    numeroCamisola INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(pessoaID)
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
    tempo TIME NOT NULL,
    jogoID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID)
);
CREATE TABLE Golo(
    ID INT,
    eventoID INT,
    jogadorID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(pessoaID)
);
CREATE TABLE Falta(
    ID INT,
    eventoID INT,
    arbitroID INT,
    jogadorID INT,
    gravidade TEXT DEFAULT 'regular' NOT NULL CONSTRAINT GravidadeNome CHECK (
        gravidade = 'regular'
        OR gravidade = 'azul'
        OR gravidade = 'vermelho'
    ),
    PRIMARY KEY (ID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID),
    FOREIGN KEY (arbitroID) REFERENCES Arbitro(pessoaID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(pessoaID)
);
CREATE TABLE Pessoa(
    ID INT,
    nome TEXT NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE Cronometrista(
    pessoaID INT,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID)
);
CREATE TABLE TreinadorAdjunto(
    pessoaID INT,
    equipaID INT,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID)
);
CREATE TABLE Treinador(
    pessoaID INT,
    equipaID INT,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID)
);
CREATE TABLE DelegadoTecnico(
    pessoaID INT,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID)
);
CREATE TABLE Delegado(
    pessoaID INT,
    equipaID INT,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID)
);
CREATE TABLE Jogador(
    pessoaID INT,
    equipaID INT,
    nacionalidade TEXT DEFAULT 'portuguesa' NOT NULL,
    idade INT NOT NULL CONSTRAINT IdadeAdulta CHECK (idade >= 18),
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID)
);
CREATE TABLE Arbitro(
    pessoaID INT,
    associacao TEXT NOT NULL,
    categoria TEXT NOT NULL CONSTRAINT CategoriaNome CHECK (categoria = 'principal' OR categoria = 'mesa'),
    PRIMARY KEY(pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID)
);
CREATE TABLE PessoaJogo(
    jogoID INT,
    arbitroID INT,
    cronometristaID INT,
    delegadoTecnicoID INT,
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID),
    FOREIGN KEY (arbitroID) REFERENCES Arbitro(pessoaID),
    FOREIGN KEY (cronometristaID) REFERENCES Cronometrista(pessoaID),
    FOREIGN KEY (delegadoTecnicoID) REFERENCES DelegadoTecnico(pessoaID)
);
CREATE TABLE Pavilhao(
    ID INT,
    jogoID INT,
    nome TEXT NOT NULL,
    codigoPostal VARCHAR(8) NOT NULL,
    cidade TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID)
);