# coding: utf-8
# classe que contera a aplicação
# github.com/carloscuzik

#Inicio do programa

#Autenticação de Usuário
conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
conexao.conectar
conexao.sleciona_db
while 1==1 do
	puts "Digite seu CPF"
	cpf = gets.chomp
	puts "Digite sua senha"
	senha = gets.chomp
	retorno = conexao.lista_table("user","WHERE cpf = '#{cpf}' AND senha = '#{senha}'","*")
	if retorno[0][1]==cpf && retorno[0][1]!="" then
		@user = Usuario.new(retorno[0][0],retorno[0][1],retorno[0][2])
		break
	end
end
conexao.fecha_db
#Carrega o BD para a memória

@user.conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
@user.conexao.conectar
@user.conexao.sleciona_db

#Roda o programa pra sempre
while 1==1 do
	print "Em que ponto voĉe esta: "
	@user.ponto_atual = Integer(gets.chomp)

	print "Para onde você quer ir? "
	destino = Integer(gets.chomp)

	puts "O que você dseja seber?"
	puts "1 - Qual onibus deve pegar"
	puts "2 - Qual onibus chega mais rapido"
	escolha = Integer(gets.chomp)

	oni = @user.onibus_disponiveis(destino)

	case escolha
	when 1
		puts "Os Onibus que pode pegar são"
		if(oni.length() == 0) then 
			puts "não a opições vá a um terminal primeiro"
		else
			count = 1
			oni.each do |linha|
				puts "#{count} => #{linha[1]}"
				count += 1
			end
		end
	when 2
		if(oni.length() == 0) then 
			puts "não a opições vá a um terminal primeiro"
		else
			puts "Os Onibus que vão chegar mais rapido onde esta é"
			proximos = @user.onibus_melhor(oni)
			if(proximos.length() == 0) then 
				puts "não a opições hoje mais"
			end
			proximos.each do |linha|
				puts "#{count} => #{linha[4]}"
				break
			end
		end
	else
		puts "opcao invalida"
	end
end
#Fecamento do Banco de dados

@user.conexao.fecha_db

#Fim do programa