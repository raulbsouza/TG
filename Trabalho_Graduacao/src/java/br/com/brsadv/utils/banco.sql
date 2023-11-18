Create table estado(
    idestado serial primary key,
    nomeestado varchar(100) not null,
    siglaestado varchar(2) not null
);
insert into estado(nomeestado, siglaestado)values ('São Paulo', 'SP');

create table cidade(
    idcidade serial primary key,
    idestado integer references estado(idestado),
    nomecidade varchar(100) not null,
    cep integer not null
);
insert into cidade(nomecidade,cep,idestado) values('São Francisco', 15710000, 1);

create table areas (
	idarea serial primary key,
	nomearea varchar(50) not null,
	descricao varchar(350) not null
);
insert into areas(nomearea, descricao )
values('Civil', 'A advocacia cível é uma área de atuação que engloba todos as questões de relacionamento civil. Os advogados da área cível estão constantemente buscando soluções para trazer benefícios para as empresas, seja com trabalho preventivo, como a revisão de contratos, ou pró-ativo, como recuperação de crédito.');

create table enderecos (
	idendereco serial primary key,
	estado integer references estado(idestado),
	cidade integer references cidade(idcidade),
	rua varchar(50) not null,
	numero integer not null
);
insert into enderecos(estado, cidade, rua, numero)values(1,1,'Minas Gerais',1103);

create table pessoa (
  idpessoa serial primary key,
  nome varchar(100) not null,
  cpfcnpj varchar(14) not null unique,
  datanascimento date,
  idcidade int,
  login varchar(20),
  senha varchar(20),
  foto text,
  constraint fk_cidade foreign key (idcidade) references cidade
);

insert into pessoa (nome, cpfcnpj, datanascimento, idcidade, login, senha, foto)
      values ('adm','42745947001', '01-01-2020', 1, 'adm','123',null);

create table administrador (
    idadministrador serial primary key,
    idpessoa int unique,
    situacao varchar(1),
    permitelogin varchar(1),
    constraint fk_administrador_pessoa foreign key (idpessoa) references pessoa
);

insert into administrador (idpessoa,situacao,permitelogin)
      values (1,'A','S');

create table cliente (
   idcliente serial primary key,
   idpessoa int unique,
   situacao varchar(1),
   permitelogin varchar(1),
   constraint fk_cliente_pessoa foreign key (idpessoa) references pessoa
);

 create table adv (
   idfornecedor serial primary key,
   idpessoa int unique,
   area integer references areas(idarea),
	oab varchar (8) not null,
	sobre varchar(200),
	insta varchar(150),
	linkedin varchar(150),
	facebook varchar(150),
   situacao varchar(1),
   permitelogin varchar(1),
   constraint fk_fornecedor_pessoa foreign key (idpessoa) references pessoa
);
