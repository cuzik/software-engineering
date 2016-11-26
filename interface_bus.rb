# coding: utf-8
# classe que contera a aplicação
# github.com/carloscuzik

#Inicio do programa

#Autenticação de Usuário
conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
conexao.conectar
conexao.sleciona_db

puts "Digite o numero do gps do onibus"
gps = Integer(gets.chomp)
retorno = conexao.lista_table("Onibus","WHERE id_oni = #{gps}","*")
@bus = Onibus.new(retorno[0][0],retorno[0][1],Integer(retorno[0][2]),retorno[0][3],retorno[0][4])

conexao.fecha_db
#Carrega o BD para a memória

@bus.conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
@bus.conexao.conectar
@bus.conexao.sleciona_db

#Roda o programa pra sempre
while 1==1 do
	system "clear"
	puts "Entre com o ponto mais proximo:"
	pt = Integer(gets.chomp)
	@bus.atualiza_localizacao(pt)

	puts "Entre com velocidade média:"
	vel = Float(gets.chomp)
	@bus.atualiza_velocidade(vel)

	while 1 == 1 do
		puts "Subio alguem: (y/n)?"
		subio = gets.chomp
		if(subio == 'y') then
			@bus.sobe_passageiro
		else
			break
		end
	end
	while 1 == 1 do
		puts "Desceu alguem: (y/n)?"
		desceu = gets.chomp
		if(desceu == 'y') then
			@bus.desce_passageiro
		else
			break
		end
	end
	@bus.atualiza_passageiros
end
#Fecamento do Banco de dados

@bus.conexao.fecha_db

#Fim do programa