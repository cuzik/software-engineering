-- Inserindo novas informações nas tabelas

-- Criar a tabela dos pontos
insert into Ponto(id_pt,LA,LO) values
	(1,0,0),
	(2,0,0),
	(3,0,0),
	(4,0,0),
	(5,0,0),
	(6,0,0),
	(7,0,0),
	(8,0,0),
	(9,0,0),
	(10,0,0),
	(11,0,0),
	(12,0,0),
	(13,0,0),
	(14,0,0),
	(15,0,0),
	(16,0,0),
	(20,0,0);

-- Criar a tabela das distancias entre os pontos
insert into Distancia(id_partida,id_chegada,distancia) values
	(1,2,1),
	(1,3,1),
	(2,4,1),
	(2,5,1),
	(2,20,1),
	(3,4,1),
	(3,7,1),
	(4,5,1),
	(4,7,1),
	(4,10,1),
	(5,6,1),
	(5,20,1),
	(6,9,1),
	(6,13,1),
	(6,20,1),
	(7,8,1),
	(7,10,1),
	(7,11,1),
	(7,12,1),
	(7,15,1),
	(7,16,1),
	(8,9,1),
	(8,11,1),
	(8,12,1),
	(8,14,1),
	(8,15,1),
	(8,16,1),
	(9,12,1),
	(9,13,1),
	(9,14,1),
	(10,11,1),
	(10,15,1),
	(11,12,1),
	(11,15,1),
	(11,16,1),
	(12,14,1),
	(12,15,1),
	(12,16,1),
	(13,14,1),
	(13,16,1),
	(14,16,1),
	(15,16,1);

-- Criar a tabela das rotas
insert into Rota(id_rt,nome) values
	(1,"Rota via alameda"),
	(2,"Fundos do bairro"),
	(3,"Bla bla bla");

-- Criar a tabela dos pontos pertencentes as rotas
insert into Ponto_Rota(id_pt,id_rt,pos) values
	(2,1,1),
	(1,1,2),
	(3,1,3),
	(10,1,4),
	(15,1,5),
	(16,1,6),
	(13,1,7),
	(6,1,8),
	(2,2,1),
	(4,2,2),
	(10,2,3),
	(11,2,4),
	(8,2,5),
	(9,2,6),
	(6,2,7),
	(2,3,1),
	(4,3,2),
	(7,3,3),
	(8,3,4),
	(9,3,5),
	(6,3,6);

-- Criar a tabela dos onibus
insert into Onibus(id_oni,placa,n_vagas,LA,LO) values
	(1,"AAA0001",40,0,0),
	(2,"AAA0002",40,0,0),
	(3,"AAA0003",40,0,0),
	(4,"AAA0004",40,0,0),
	(5,"AAA0005",40,0,0);

-- Criar a tabela dos onibus alocas nas rotas
insert into Alocado(id_rt,id_oni,hora_saida,hora_chegada) values
	(1,1,"13:30:00","14:00:00"),
	(1,2,"15:30:00","16:00:00"),
	(1,3,"17:30:00","18:00:00"),
	(2,4,"15:45:00","16:20:00"),
	(2,5,"18:45:00","19:20:00");
