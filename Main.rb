# coding: utf-8
# classe que contera a aplicação
# github.com/carloscuzik

require_relative "Usuario"
require_relative "Administrador"
require_relative "Rota"
require_relative "Ponto"
require_relative "Onibus"
require_relative "Conexao"

#Declaração de variaveis globais e constantes

@hora_local = "13:00:00"

#Carrega o BD para a memória
@conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
@conexao.conectar
@conexao.sleciona_db

#Funções

def onibus_disponiveis(pt1,pt2)
	retorno = @conexao.lista_table("Ponto_Rota p1 JOIN Ponto_Rota p2 ON p1.id_pt = #{pt1} AND p2.id_pt = #{pt2} AND p1.id_rt = p2.id_rt AND p1.pos < p2.pos JOIN Rota r ON r.id_rt = p1.id_rt","","r.id_rt,r.nome")
	return retorno;
end

def onibus_melhor(oni)
	rotas_possiveis = ""
	count = oni.length()
	oni.each do |linha|
		rotas_possiveis << "#{linha[0]}"
		count -= 1
		if(count!=0) then
			rotas_possiveis << ","
		end
	end
	retorno = @conexao.lista_table("Alocado a JOIN Rota r ON a.id_rt = r.id_rt","WHERE a.hora_saida > '#{@hora_local}' AND a.id_rt IN (#{rotas_possiveis}) ORDER BY a.hora_saida","*")
	return retorno
end


#Inicio do programa

user = Usuario.new(1,"09309261960","Carlos Eduardo Cuzik","asd")
print "Em que ponto voĉe esta: "
user.ponto_atual = Integer(gets.chomp)

print "Para onde você quer ir? "
destino = Integer(gets.chomp)

puts "O que você dseja seber?"
puts "1 - Qual onibus deve pegar"
puts "2 - Qual onibus chega mais rapido"
escolha = Integer(gets.chomp)

oni = onibus_disponiveis(user.ponto_atual,destino)

case escolha
when 1
	puts "Os Onibus que pode pegar são"
	if(oni.length() == 0) then 
		puts "não a opições vá a um terminal primeiro"
	end
	count = 1
	oni.each do |linha|
		puts "#{count} => #{linha[1]}"
		count += 1
	end
when 2
	puts "Os Onibus que vão chegar mais rapido onde esta é"
	proximos = onibus_melhor(oni)
	if(proximos.length() == 0) then 
		puts "não a opições hoje mais"
	end
	proximos.each do |linha|
		puts "#{count} => #{linha[4]}"
		break
	end

else
	puts "opcao invalida"
end

#Fecamento do Banco de dados

@conexao.fecha_db

#Fim do programa