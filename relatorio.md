# BD - FIRST REPORT 

## Campeonato Hoquei em Patins da 1ª Divisao  
\
\
Valter Castro  **up201706546@up.pt**

Rodrigo 

Beatriz 

## Descricao
\
Este projeto baseia-se na gestao de um servico para um campeonato de hoquei em patins.

O campeonato de hoquei em patins tem um nome, uma epoca e uma divisao. E constituido por uma fase regular e uma fase de playoff de apuramento para decidir o campeao. A fase regular tem 26 jornadas, cada uma com 7 jogos entre uma equipa visitante e uma equipa visitada. Em cada jornada sao registados os marcadores dos golos. Uma epoca tem uma data.

Cada equipa tem um nome, um clube e a sua composicao pode variar em cada epoca. Todos os clubes pertencem a uma liga e teem um nome e uma morada. As 8 equipas com mais pontos na fase regular disputam o playoff. Das restantes 6 equipas, as 3 melhores posicionadas mantem-se no campeonato da 1ª divisao e as 3 com menor pontuacao descem para o campeonato da segunda divisao. No playoff, as equipas defrontam-se em jogos de varias maos, sendo que nos quartos de final, os jogos sao disputados num esquema "melhor de 3 jogos"(vence a primeira equipa a ganhar 2 jogos). As meias-finais e final, disputam-se num esquema "melhor de 5 jogos"(vence a primeira equipa a ganhar 3 jogos).

Normalmente, uma equipa e constituida por 1 treinador principal, 1 treinador adjunto, 1 delegado e os seus jogadores. Cada treinador pode convocar para a ficha de jogo 10 jogadores. Em pista, podem estar simultaneamente 5 jogadores em cada equipa(4 jogadores em campo e 1 guarda redes). 


O periodo de inscricao de jogadores e feito ate final de dezembro. Se um jogador mudar de equipa durante este periodo so pode voltar a competir oficialmente a partir de janeiro.


Cada jogo tem uma equipa visitante e uma equipa visitada. O jogo tem tambem um identificador e e referente a um campeonato. O mesmo e arbitrado por 2 arbitros principais e por 2 arbitros de mesa(que controlam o tempo de ataque e o marcador de faltas). Tambem ha 1 cronometrista que visa cronometrar o tempo de jogo e 1 delegado tecnico que avalia a exibicao dos arbitros.


Num jogo existem eventos variados que podemos especificar:

>Cartao - Cada arbitro pode atribuir um cartao azul ou vermelho. Um cartao azul obriga a suspensao temporaria do jogador durante 2 minutos e o vermelho expulsa o jogador definitivamente do jogo. Apos sinalizacao do cartao azul 3 vezes ao mesmo jogador , o mesmo recebe cartao vermelho.
>
>Golo - Cada golo tem um tempo e um marcador registado.


Cada clube decide o horario dos seus jogos em casa, bem como a data da disputa do mesmo.

O jogo habitualmente e disputado no pavilhao da equipa visitado, podendo haver excecoes(por exemplo castigos, ou quando o piso esta em mal estado). O pavilhao tem um nome, um codigo postal e existe numa cidade.






