PRAGMA FOREIGN_KEYS = ON;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Epoca;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Campeonato;
DROP TABLE IF EXISTS Pavilhao;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Regular;
DROP TABLE IF EXISTS Playoff;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Cronometrista;
DROP TABLE IF EXISTS TreinadorAdjunto;
DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS DelegadoTecnico;
DROP TABLE IF EXISTS Delegado;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Arbitro;
DROP TABLE IF EXISTS PessoaJogo;
DROP TABLE IF EXISTS Fichajogo;
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS Golo;
DROP TABLE IF EXISTS Falta;
CREATE TABLE Clube(
    ID INT,
    nome TEXT NOT NULL,
    morada TEXT,
    PRIMARY KEY (ID)
);
CREATE TABLE Epoca(
    ID INT,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE Equipa(
    ID INT,
    epocaID INT NOT NULL,
    clubeID INT NOT NULL,
    nome TEXT NOT NULL,
    pontos INT DEFAULT '0' CONSTRAINT OutOfBounds CHECK (
        pontos >= 0
        AND pontos <= 72
    ),
    PRIMARY KEY (ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID),
    FOREIGN KEY (clubeID) REFERENCES Clube(ID)
);
CREATE TABLE Campeonato(
    ID INT,
    epocaID INT NOT NULL,
    divisao TEXT,
    nome TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID)
);
CREATE TABLE Jogo(
    ID INT,
    visitanteID INT NOT NULL,
    visitadaID INT NOT NULL,
    vencedorID INT,
    campeonatoID INT NOT NULL,
    pavilhaoID INT NOT NULL,
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
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID),
    FOREIGN KEY (pavilhaoID) REFERENCES Pavilhao(ID)
);
CREATE TABLE Regular(
    campeonatoID INT,
    PRIMARY KEY (campeonatoID),
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID)
);
CREATE TABLE Playoff(
    campeonatoID INT,
    PRIMARY KEY (campeonatoID),
    FOREIGN KEY (campeonatoID) REFERENCES Campeonato(ID)
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
    equipaID INT NOT NULL,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID)
);
CREATE TABLE Treinador(
    pessoaID INT,
    equipaID INT NOT NULL,
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
    equipaID INT NOT NULL,
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID)
);
CREATE TABLE Jogador(
    pessoaID INT,
    equipaID INT NOT NULL,
    epocaID INT NOT NULL,
    nacionalidade TEXT DEFAULT 'portuguesa' NOT NULL,
    idade INT NOT NULL CONSTRAINT IdadeAdulta CHECK (idade >= 18),
    PRIMARY KEY (pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID),
    FOREIGN KEY (equipaID) REFERENCES Equipa(ID),
    FOREIGN KEY (epocaID) REFERENCES Epoca(ID)

);
CREATE TABLE Arbitro(
    pessoaID INT,
    associacao TEXT ,
    categoria TEXT NOT NULL CONSTRAINT CategoriaNome CHECK (
        categoria = 'internacional'
        OR categoria = 'A1'
    ),
    PRIMARY KEY(pessoaID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoa(ID)
);
CREATE TABLE PessoaJogo(
    jogoID INT,
    arbitroID INT NOT NULL,
    cronometristaID INT NOT NULL,
    delegadoTecnicoID INT NOT NULL,
    PRIMARY KEY (jogoID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID),
    FOREIGN KEY (arbitroID) REFERENCES Arbitro(pessoaID),
    FOREIGN KEY (cronometristaID) REFERENCES Cronometrista(pessoaID),
    FOREIGN KEY (delegadoTecnicoID) REFERENCES DelegadoTecnico(pessoaID)
);
CREATE TABLE Pavilhao(
    ID INT,
    nome TEXT NOT NULL,
    codigoPostal VARCHAR(8) NOT NULL,
    cidade TEXT NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE FichaJogo(
    ID INT,
    jogoID INT NOT NULL,
    equipaID INT NOT NULL,
    jogadorID INT NOT NULL,
    titularidade TEXT DEFAULT 'titular' NOT NULL CONSTRAINT TitularidadeNome CHECK (
        titularidade = 'banco'
        OR titularidade = 'titular'
    ),
    numeroCamisola INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(pessoaID)
);
CREATE TABLE Evento(
    ID INT,
    tempo TIME NOT NULL,
    jogoID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (jogoID) REFERENCES Jogo(ID)
);
CREATE TABLE Golo(
    eventoID INT,
    jogadorID INT,
    PRIMARY KEY (eventoID, jogadorID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(pessoaID)
);
CREATE TABLE Falta(
    eventoID INT,
    arbitroID INT NOT NULL,
    jogadorID INT NOT NULL,
    gravidade TEXT DEFAULT 'falta de equipa' NOT NULL CONSTRAINT GravidadeNome CHECK (
        gravidade = 'falta de equipa'
        OR gravidade = 'azul'
        OR gravidade = 'vermelho'
    ),
    PRIMARY KEY (eventoID, arbitroID),
    FOREIGN KEY (eventoID) REFERENCES Evento(ID),
    FOREIGN KEY (arbitroID) REFERENCES Arbitro(pessoaID),
    FOREIGN KEY (jogadorID) REFERENCES Jogador(pessoaID)
);