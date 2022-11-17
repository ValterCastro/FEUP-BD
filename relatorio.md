# BD - FIRST REPORT 

## Campeonato Hoquei em Patins da 1ª Divisao  
\
\
Valter Castro  **up201706546@up.pt**

Rodrigo Martins **up202008868@up.pt**

Maria Carneiro **up202107798@up.pt**

## Descricao
\
Este projeto baseia-se na gestao de um servico para um `campeonato de hoquei em patins`.

O `campeonato` de hoquei em patins tem um nome, uma `epoca` e uma divisao. E constituido por uma fase `regular` e uma fase de `playoff` de apuramento para decidir o campeao. A fase regular tem 26 jornadas, cada uma com 7 jogos entre uma equipa visitante e uma equipa visitada. Em cada jornada sao registados os marcadores dos golos. Uma epoca tem uma data de abertura e uma data final.

Cada `equipa` tem um nome, os respetivos pontos do campeonato, um `clube` e a sua composicao pode variar em cada epoca. Todos os clubes pertencem a uma liga e teem um nome e uma morada. As 8 equipas com mais pontos na fase regular disputam o playoff. Das restantes 6 equipas, as 3 melhores posicionadas mantem-se no campeonato da 1ª divisao e as 3 com menor pontuacao descem para o campeonato da segunda divisao. No playoff, as equipas defrontam-se em jogos de varias maos, sendo que nos quartos de final, os jogos sao disputados num esquema "melhor de 3 jogos"(vence a primeira equipa a ganhar 2 jogos). As meias-finais e final, disputam-se num esquema "melhor de 5 jogos"(vence a primeira equipa a ganhar 3 jogos).

Normalmente, uma equipa e constituida por 1 `treinador` principal, 1 `treinador adjunto`, 1 `delegado` e respetivos jogadores. Cada treinador pode convocar para a ficha de jogo 10 jogadores. Nesta e sabido a titularidade de cada um e respetivo numero de camisola. Em pista, podem estar simultaneamente 5 jogadores em cada equipa(4 jogadores em campo e 1 guarda redes). 

Os `jogadores` teem nome, nacionalidade e idade. O periodo de inscricao de jogadores e feito ate final de dezembro. Se um jogador mudar de equipa durante este periodo so pode voltar a competir oficialmente a partir de janeiro.

Um `Arbitro` tem um nome, uma associacao e tem uma categoria de arbitro internacional ou A1.

Cada `jogo` tem uma equipa visitante e uma equipa visitada. O jogo tem tambem um identificador e e referente a um campeonato. O mesmo e arbitrado por 2 arbitros principais e por 2 arbitros de mesa(que controlam o tempo de ataque e o marcador de faltas). Estes podem ser internacionais ou A1. Tambem ha 1 `cronometrista` que visa cronometrar o tempo de jogo e 1 `delegado tecnico` que avalia a exibicao dos arbitros. No final do jogo ha 1 vencedor, 1 derrotado e pode haver empate.


Num jogo existem eventos variados que podemos especificar:

>`Falta` - Cada arbitro pode atribuir um cartao azul ou vermelho. Um cartao azul obriga a suspensao temporaria do jogador durante 2 minutos e o vermelho expulsa o jogador definitivamente do jogo. Apos sinalizacao do cartao azul 3 vezes ao mesmo jogador , o mesmo recebe cartao vermelho. No caso de a gravidade da falta ser baixa e apenas considerada falta de equipa.
>
>`Golo` - Cada golo tem um tempo e um marcador registado.

Cada clube decide o horario dos seus jogos em casa, bem como a data da disputa do mesmo.

O jogo habitualmente e disputado no `pavilhao` da equipa visitado, podendo haver excecoes(por exemplo castigos, ou quando o piso esta em mal estado). O pavilhao tem um nome, um codigo postal e existe numa cidade.

## Diagrama UML
\
![alt text](https://github.com/ValterCastro/FEUP-BD/blob/master/umldiagram.png?raw=true)

## Esquema Relacional & Dependencias Funcionais
\
**Clube**(<ins>*ID*</ins>, nome, morada) 

1. {ID}->{nome, morada}

**Epoca**(<ins>*ID*</ins>, dataInicio, dataFim)

1. {ID}->{dataInicio, dataFim}

**Equipa**(<ins>*ID*</ins>, *epocaID->Epoca*, *clubeID->Clube*, nome, pontos)

1. {ID}->{epocaID->Epoca, clubeID->Clube, nome, pontos}
2. {clubeID->Clube}->{ID, nome, epocaID->Epoca, pontos}

**Campeonato**(<ins>*ID*</ins>, *epocaID->Epoca*, divisao, nome)

1. {ID}->{epocaID->Epoca, divisao, nome}

**Jogo**(<ins>*ID*</ins>, *visitanteID->Equipa*,  *visitadaID->Equipa*, *vencedorID->Equipa*,  *campeonatoID->Campeonato*, *pavilhaoID->Pavilhao*, numeroJogo, tempoInicio, tempoFim,  categoria)

1. {ID}->{visitanteID->Equipa, visitadaID->Equipa,           vencedorID->Equipa, campeonatoID->Campeonato, pavilhaoID->Pavilhao, numeroJogo,  tempoInicio, tempoFim, categoria}


**Regular**(<ins>*campeonatoID->Campeonato*</ins>)

1. {campeonatoID->Campeonato}->{} 

**PlayOff**(<ins>*campeonatoID->Campeonato*</ins>)

1. {campeonatoID->Campeonato}->{}

**Pessoa**(<ins>*ID*</ins>, nome)

1. {ID}->{nome}

**Cronometrista**(<ins>*pessoaID->Pessoa*</ins>)

1. {pessoaID->Pessoa}->{}

**TreinadorAdjunto**(<ins>*pessoaID->Pessoa*</ins>, *equipaID->Equipa*)

1. {pessoaID->Pessoa}->{equipaID->Equipa}

**Treinador**(<ins>*pessoaID->Pessoa*</ins>, *equipaID->Equipa*)

1. {pessoaID->Pessoa}->{equipaID->Equipa}

**DelegadoTecnico**(<ins>*pessoaID->Pessoa*</ins>)

1. {pessoaID->Pessoa}->{}

**Delegado**(<ins>*pessoaID->Pessoa*</ins>, *equipaID->Equipa*)

1. {pessoaID->Pessoa}->{equipaID->Equipa}

**Jogador**(<ins>*pessoaID->Pessoa*</ins>, *equipaID->Equipa*, *epocaID->Epoca*, nacionalidade, idade)

1. {pessoaID->Pessoa}->{equipaID->Equipa, epocaID->Epoca, nacionalidade, idade}

**Arbitro**(<ins>*pessoaID->Pessoa*</ins>, associacao, categoria)

1. {pessoaID->Pessoa}->{associacao, categoria}

**PessoaJogo**(<ins>*jogoID->Jogo*</ins>, *arbitroID->Arbitro*, *cronometristaID->Cronometrista*, *delegadoTecnicoID->DelegadoTecnico*)

**Pavilhao**(<ins>*ID*</ins>, nome, codigoPostal, cidade)

1. {ID}->{nome, codigoPostal, cidade}

**FichaJogo**(<ins>*ID*</ins>, *jogoID->Jogo*, *jogadorID->Jogador*, titularidade, numeroCamisola)

1. {ID}->{jogoID->Jogo, jogadorID->Jogador, titularidade,  numeroCamisola}

**Evento**(<ins>*ID*</ins>, tempo, *jogoID->Jogo*)

1. {ID}->{tempo, jogoID->Jogo}

**Golo**(<ins>*eventoID->Evento*</ins>,   <ins>*jogadorID->Jogador*</ins>)

1. {eventoID->Evento, jogadorID->Jogador}->{}

**Falta**(<ins>*eventoID->Evento*</ins>, <ins>*arbitroID->arbitro*</ins>, *jogadorID->Jogador*, gravidade)

1. {eventoID->Evento}->{arbitroID->arbitro, jogadorID->Jogador, gravidade}

## Formas Normais
\
Para identificar a `3ª Forma Normal`, sera necessario assegurar o cumprimento da regra de `nao-transitividade`. Caso esta regra seja quebrada, tambem sera a Forma Normal de Boyce-Codd, visto esta se tratar de uma versao ligeiramente mais restrita da anterior.
No modelo proposto, não existira quebra da 3ª Forma Normal, nem da Forma Normal de `Boyce-Codd` na medida em que o lado esquerdo de cada dependencia e uma `super-key` do esquema relacional – condicao suficiente para cumprir ambas.

## Restricoes
\
Para assegurar uma boa `manutencao` da base de dados,  assim como fornecer `seguranca` adicional ao utilizador, recorreu-se ao uso de restricoes na producao de varias classes, nomeadamente do tipo chave, de `integridade referencial`, `CHECK` E `NOT NULL`.

Nas ocasioes onde a restricao NOT NULL e associada a um atributo, manifesta-se a obrigatoriedade da existencia deste mesmo atributo para a formacao minima da classe. No seguinte modelo a restricao `NOT NULL` e utilizada:

* O atributo nome de **Clube** e importante para a sua identificacao.

* O atributo data tem uma profunda ligacao na existencia de uma **Epoca** sendo necessario a sua implementacao.

* O atributo nome de **Equipa** e importante para a sua identificacao.

* O atributo nome de **Campeonato** e importante para a sua identificacao.

* Os atributos tempoInicio e tempoFim de **Jogo** determinam a sua duracao sendo necessarios. O atributo categoria permite saber que campeonato se trata.

* Os atributos titularidade e numeroCamisola sao essenciais para a **FichaJogo** de um jogador.

* O atributo tempo de **Evento** carateriza este mesmo.

* O atributo gravidade permite saber que tipo de **Falta** e dada.

* O nome de **Pessoa** e necessario para a identificacao da mesma.

* A nacionalidade e idade de um **Jogador** sao necessarios para fins contratuais , sendo que, estes nao estando presentes no esquema , terao integracao facilitada numa futura extensao do mesmo.

* A categoria de um **Arbitro** permite saber num jogo qual o tipo do arbitro.

* O nome, codigo postal e cidade, dao a saber a localizacao de um **Pavilhao**, sendo assim, necessarios.

* Todos os atributos designados para foreign keys das tabelas são NOT NULL com excecao de vencedor em **Jogo**, dado que pode haver um empate. 

A restricao `CHECK`:

* O atributo pontos de **Equipa** tem um limite entre 0 e 72, sendo absurdo qualquer outro valor no contexto abordado.

* O atributo categoria de **Jogo** so podera ser jornada, quartos-final, meia-final ou final.

* O atributo titularidade de **FichaJogo** so pode tomar como valor banco ou titular.

* O atributo gravidade de **Falta** so podera ser falta de equipa, azul ou vermelho.

* O atributo categoria de **Arbitro** so sera internacional ou A1.

* O atributo codigoPostal de **Pavilhao** esta limitado a 8 carateres que e o limite de um codigo postal.

A restricao `UNIQUE`neste modelo relacional nao foi determinada, como necessaria, para alem das PKs.

Por ultimo, relativamente a restricoes de `integridade referencial`, foram aplicadas chaves estrangeiras a classes intrinsecamente relacionadas com outras. Como exemplo , um **Campeonato** e **Regular** ou **PlayOff** , sendo necessario uma chave estrangeira apontada nos IDs de regular e playoff para campeonato.

Este raciocinio foi aplicado para as restantes classes que dispoem destas restricoes, resultando num modelo bastante trivial de interpretar.





