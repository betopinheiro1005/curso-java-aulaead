-- PARTE 1

-- Criando o banco de dados
create database dbinfox;

-- Selecionando o banco de dados a ser utilizado
use dbinfox;

-- Criando a tabela de usuários do sistema
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- Descrevendo a estrutura da tabela
describe tbusuarios;

-- Inserindo dados na tabela
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (1,'José de Assis','9999-9999','joseassis','123456');

-- Exibindo os dados da tabela
select * from tbusuarios;

-- Inserindo mais dois usuários
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (2,'Administrador','9999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (3,'Bill Gates','9999-9999','bill','123456');

-- Modificando dados na tabela
update tbusuarios set fone='8888-8888' where iduser=2;

-- Excluindo um registro da tabela
delete from tbusuarios where iduser='3';

-- Criando a tabela de clientes
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

-- Descrevendo a estrutura da tabela
describe tbclientes;

-- Inserindo dados na tabela
insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values ('Linus Torvalds','Rua Tux,2015','9999-9999','linus@linux.com');

-- Exibindo os dados na tabela
select * from tbclientes;

-- Criando a tabela de ordem de serviços (OS)

use dbinfox;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key (idcli) references tbclientes(idcli)
);

-- Descrevendo a estrutura da tabela
describe tbos;

-- Inserindo dados na tabela
insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('Notebook','Não liga','Troca da fonte','Zé',87.50,1);

-- Exibindo os dados da tabela
select * from tbos;

-- Relacionando a tabela de clientes com a tabela de ordem de serviços
select 
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli 
from tbos as O
inner join tbclientes as C
on (C.idcli = O.idcli);

-- PARTE 2

-- Selecionando o banco de dados a ser utilizado
use dbinfox;

-- Inserir mais um usuário na tabela tbusuarios:

insert into tbusuarios (iduser,usuario,fone,login,senha)
values (3,'Leandro Ramos','9999-9999','leandro','123');

select * from tbusuarios;

-- Adicionando o campo "perfil" na tabela "tbusuarios"

alter table tbusuarios add column perfil varchar(20) not null;
describe tbusuarios;

-- Removendo um campo da tabela

alter table tbusuarios drop column perfil;

-- Adicionando novamente o campo "perfil" na tabela "tbusuarios"

alter table tbusuarios add column perfil varchar(20) not null;

-- Preenchendo o campo perfil

update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;


-- PARTE 3

-- Selecionando o banco de dados a ser utilizado
use dbinfox;

-- Inserir clientes na tabela tbuclientes:

insert into tbclientes(nomecli,endcli,fonecli,emailcli) values ('José de Assis Filho','Rua do Gasometro, 1234','9999-9999','professorjoseassis@gmail.com');
insert into tbclientes(nomecli,endcli,fonecli,emailcli) values ('João da Silva','Rua Vitória, 56','5678-9009','joao@hotmail.com');
insert into tbclientes(nomecli,endcli,fonecli,emailcli) values ('Leandro Ramos','Rua Tuiuti, 2900','3900-0000','professorjoseassis@gmail.com');
insert into tbclientes(nomecli,endcli,fonecli,emailcli) values ('Juliana Paes','Rua Santa Luzia, 456','7890-0987','ju@globo.com');
insert into tbclientes(nomecli,endcli,fonecli,emailcli) values ('Joaquim Jorge','Av. Sumaré, 2009 - casa 2','2908-0987','joaquim@yahoo.com');

select * from tbclientes;


-- PARTE 4

use dbinfox;
describe tbclientes;
select * from tbclientes;
-- a linha abaixo cria um apelido aos campos da tabela
select idcli as Id, nomecli as Nome, fonecli as Fone from tbclientes where nomecli like 'Jo%';



-- PARTE 5

use dbinfox;
describe tbos;

-- A linha abaixo altera a tabela adicionando um campo em uma determinada posição

alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

use dbinfox;

select * from tbos;


-- PARTE 6

use dbinfox;

select * from tbclientes;

-- A instrução abaixo seleciona e ordena por nome todos os clientes cadastrados

select * from tbclientes order by nomecli;

describe tbclientes;

-- PARTE 7

use dbinfox;

-- O bloco ce instruções abaixo faz a seleção e união de dados de duas tabelas
-- OSER é uma variável que contém os campos desejados da tabela OS
-- CLI é uma variável que contém os campos desejados da tabela Clientes

select 
OSER.os,data_os,tipo,situacao,equipamento,valor,
CLI.nomecli,fonecli 
from tbos as OSER
inner join tbclientes as Cli
on (CLI.idcli = OSER.idcli);



