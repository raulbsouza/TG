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

create table advogados(
	idadv serial primary key,
	nome varchar(100) not null,
	area integer references areas(idarea),
	oab varchar (8) not null,
	endereco integer references enderecos(idendereco),
	sobre varchar(200),
	insta varchar(150),
	linkedin varchar(150),
	facebook varchar(150)
);
insert into advogados(nome,area,oab,endereco,sobre,insta,linkedin,facebook)
values('Raul Bastos',1,'SP999666',1,'Advogado Civil que adora receber PIX !','link 1','link 2', 'link 3');