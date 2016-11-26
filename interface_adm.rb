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
	retorno = conexao.lista_table("adm","WHERE cpf = '#{cpf}' AND senha = '#{senha}'","*")
	if retorno[0][1]==cpf && retorno[0][1]!="" then
		@adm = Usuario.new(retorno[0][0],retorno[0][1],retorno[0][2])
		break
	end
end
conexao.fecha_db
#Carrega o BD para a memória

@adm.conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
@adm.conexao.conectar
@adm.conexao.sleciona_db

#Roda o programa pra sempre
while 1==1 do
	system "clear"
	puts "O que deseja Fazer?"
	puts "1- Inserir"
	puts "2- Deletar"
	puts "3- Atualizar"
	escolha = Integer(gets.chomp)
	case escolha
	when 1
		system "clear"
		puts "O que deseja Inserir"
		puts "1- Onibus"
		puts "2- "
		opcao = Integer(gets.chomp)
		case opcao
		when 1

		when 2

		else
			puts "Operação invalida"
		end
				
	when 2
		system "clear"
		puts "O que deseja Deletar"
		puts "1- Onibus"
		puts "2- "
		opcao = Integer(gets.chomp)
		case opcao
		when 1

		when 2

		else
			puts "Operação invalida"
		end
	when 3
		system "clear"
		puts "O que deseja Atualizar"
		puts "1- Onibus"
		puts "2- "
		opcao = Integer(gets.chomp)
		case opcao
		when 1

		when 2

		else
			puts "Operação invalida"
		end
	else
		puts "Operação invalida"
	end	
end
#Fecamento do Banco de dados

@adm.conexao.fecha_db

#Fim do programa