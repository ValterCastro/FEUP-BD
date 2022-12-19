--Qual o Plantel do OC BARCELOS 

.mode columns
.headers on
.nullvalue NULL

select Pessoa.nome as "Name", idade as "Age", nacionalidade as "NACIONALIDADE"
from Pessoa,Jogador
where pessoa.ID = Jogador.pessoaID and jogador.equipaID = 6
order by 1;