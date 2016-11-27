-- Comandos de Criação de um Banco de Dados com os principais comados do mysql

-- Criação do Banco de Dados:
drop database MindBus;
create database MindBus;

-- Abrir um BD
use MindBus

-- Criar tabelas dentro do BD aberto

-- Criar a tabela dos pontos
create table Ponto(
	id_pt int unsigned not null,
	LA int,
	LO int,
	primary key (id_pt)
);

-- Criar a tabela das distancias entre os pontos
create table Distancia(
	id_partida int unsigned not null,
	id_chegada int unsigned not null,
	distancia real,
	primary key (id_partida,id_chegada),
	foreign key (id_partida) references Ponto(id_pt),
	foreign key (id_chegada) references Ponto(id_pt)
);

-- Criar a tabela das rotas
create table Rota(
	id_rt int unsigned not null,
	nome varchar(100),
	primary key (id_rt)
);

-- Criar a tabela dos pontos pertencentes as rotas
create table Ponto_Rota(
	id_pt int unsigned not null,
	id_rt int unsigned not null,
	pos int,
	primary key (id_pt,id_rt,pos),
	foreign key (id_pt) references Ponto(id_pt),
	foreign key (id_rt) references Rota(id_rt)
);

-- Criar a tabela dos onibus
create table Onibus(
	id_oni int unsigned not null,
	placa char(7),
	n_vagas int,
	LA int,
	LO int,
	velocidade_media real,
	ponto_proximo int unsigned not null,
	primary key (id_oni),
	foreign key (ponto_proximo) references Ponto(id_pt)
);

-- Criar a tabela dos onibus alocas nas rotas
create table Alocado(
	id_rt int unsigned not null,
	id_oni int unsigned not null,
	hora_saida time, -- HH:MM:SS
	hora_chegada time, -- HH:MM:SS
	primary key (id_rt,id_oni,hora_saida),
	foreign key (id_rt) references Rota(id_rt),
	foreign key (id_oni) references Onibus(id_oni)
);

-- Criar a tabela dos usuários
create table user(
	id_user int unsigned not null,
	cpf char(11),
	nome varchar(100),
	senha varchar(30),
	primary key (id_user)
);

-- Criar a tabela dos usuários
create table adm(
	id_adm int unsigned not null,
	cpf char(11),
	nome varchar(100),
	senha varchar(30),
	primary key (id_adm)
);

-- Criar a tabela da Hora Atual
create table hora(
	atual time
);
