# coding: utf-8
# classe que contera a aplicação
# github.com/carloscuzik

#Inicio do programa

@user = Usuario.new(1,"00000000000","Padrão")
#Carrega o BD para a memória

@user.conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
@user.conexao.conectar
@user.conexao.sleciona_db

system "clear"
print "Em que ponto voĉe esta: "
@user.ponto_atual = Integer(gets.chomp)

#Roda o programa pra sempre
while 1==1 do
	while 1==1
		system "clear"
		print "Para onde você quer ir? "
		destino = Integer(gets.chomp)
		system "clear"
		puts "O que você dseja seber?"
		puts "1 - Qual são as rotas disponiveis para esse trajeto"
		puts "2 - Qual onibus chega mais rapido no local onde você está"
		puts "3 - Trocar o destino"
		escolha = Integer(gets.chomp)
		if escolha != 3 then
			break
		end
	end
	oni = @user.onibus_disponiveis(destino)
	case escolha
	when 1
		system "clear"
		puts "Os Onibus que pode pegar são"
		if(oni.length() == 0) then 
			puts "não a opções vá a um terminal primeiro"
			@proximo = ""
		else
			count = 1
			oni.each do |linha|
				puts "#{count} => #{linha[1]}"
				count += 1
			end
			puts "Qaul deseja pegar?"
			@rota = Integer(gets.chomp)
			@proximo = @user.proximo_onibus(oni[@rota-1][0])
		end
	when 2
		if(oni.length() == 0) then 
			puts "não a opções vá a um terminal primeiro"
		else
			puts "Os Onibus que vão chegar mais rapido onde esta é"
			@proximo = @user.onibus_melhor(oni)
		end
	else
		puts "opcao invalida"
	end
	if(@proximo.length() == 0) then 
		puts "não a opções hoje mais"
	else
		@linha = @proximo
		puts "#{count} => #{@linha[4]} que sai as #{@linha[2]}"
		puts "Deseja pegala? (y/n)"
		opcao = gets.chomp
		if opcao == 'y' then
			@rota = Rota.new(@linha[0],@linha[4],@linha[2])
			@rota.conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
			@rota.conexao.conectar
			@rota.conexao.sleciona_db
			@rota.insere_pontos
			@rota.pega_distancia_ponto_a_ponto
			while 1 == 1 do
				system "clear"
				puts "Voce está esperando o onibus #{@linha[1]} - #{@linha[4]} que sai as #{@linha[2]} do terminal"
				distancia_restante = @rota.calcula_distancia(@linha[1],@user.ponto_atual)
				puts "O Onibus está a #{distancia_restante}km de distancia"
				hora_atual = @user.conexao.lista_table("hora","","*")
				if hora_atual[0][0] < @linha[2] then
					puts "o onibus ainda está no terminal"
				else
					tempo_restante = @user.tempo_restante(@linha[1],distancia_restante)
					if tempo_restante == 0 then
						puts "Ele esta parado"
					else
						puts "o onibus vai demorar aproximadamente #{tempo_restante} min"
					end
				end
				puts " Atualizar (precione qq tecla)?"
				gets.chomp
			end
			@rota.conexao.fecha_db
		end
	end
end
#Fecamento do Banco de dados

@user.conexao.fecha_db

#Fim do programa