# coding: utf-8
# arquivo com as classes de teste
# github.com/carloscuzik

require_relative "Usuario"
require_relative "Administrador"
require_relative "Rota"
require_relative "Ponto"
require_relative "Onibus"
require "test/unit"

#Classe para os teste Unitários da Classe Usuario
class TesteUsuario < Test::Unit::TestCase
	def setup
		#aqui vai as declarações das variaveis que vai usar em todos os testes abaixo
	end
	#teste dos gets e sets para os atributos da classe Usuario
	def teste_sets_e_gets_user
		user = Usuario.new("09309261960","Carlos Eduardo Cuzik","asd")
		user.cpf = "09209361970"
		user.nome = "Carlos E. Cuzik"
		assert_equal("09209361970",user.cpf)
		assert_equal("Carlos E. Cuzik",user.nome)
		assert_equal(1,user.cod_user)
	end
end
#Classe para os teste Unitários da Classe Administrador
class TesteAdministrador < Test::Unit::TestCase
	def setup
		#aqui vai as declarações das variaveis que vai usar em todos os testes abaixo
	end
	#teste dos gets e sets para os atributos da classe Administrador
	def teste_sets_e_gets_adm
		adm = Administrador.new("09309261960","Carlos Eduardo Cuzik","asd")
		adm.cpf = "09209361970"
		adm.nome = "Carlos E. Cuzik"
		assert_equal("09209361970",adm.cpf)
		assert_equal("Carlos E. Cuzik",adm.nome)
		assert_equal(1,adm.cod_adm)
	end
end
#Classe para os teste Unitários da Classe Rota
class TesteRota < Test::Unit::TestCase
	def setup
		#aqui vai as declarações das variaveis que vai usar em todos os testes abaixo
	end
	#teste dos gets e sets para os atributos da classe Rota
	def teste_sets_e_gets_rota
		rota = Rota.new("Rota01",["15:50","17:30"],2)
		rota.nome = "Rota1"
		assert_equal("Rota1",rota.nome)
		assert_equal(["15:50","17:30"],rota.horarios)
		assert_equal("15:50",rota.horarios[0])
		assert_equal("17:30",rota.horarios[1])
		assert_equal(2,rota.n_rep)
		assert_equal(1,rota.cod_rota)
	end
end
#Classe para os teste Unitários da Classe Ponto
class TestePonto < Test::Unit::TestCase
	def setup
		#aqui vai as declarações das variaveis que vai usar em todos os testes abaixo
	end
	#teste dos gets e sets para os atributos da classe Ponto
	def teste_sets_e_gets_ponto
		ponto = Ponto.new("Rua ASD 01")
		ponto.endereco = "Rua ASD 1"
		assert_equal("Rua ASD 1",ponto.endereco)
		assert_equal(1,ponto.cod_pt)
	end
end
#Classe para os teste Unitários da Classe Onibus
class TesteOnibus < Test::Unit::TestCase
	def setup
		#aqui vai as declarações das variaveis que vai usar em todos os testes abaixo
	end
	#teste dos gets e sets para os atributos da classe Onibus
	def teste_sets_e_gets_onibus
		onibus_01 = Onibus.new("123","TES0001",40)
		onibus_01.codGPS = "321"
		onibus_01.placa = "TES0101"
		onibus_01.lmt_vagas = 30
		onibus_01.vlc_atual = 80.3
		assert_equal("321",onibus_01.codGPS)
		assert_equal("TES0101",onibus_01.placa)
		assert_equal(30,onibus_01.lmt_vagas)
		assert_equal(80.3,onibus_01.vlc_atual)
		assert_equal(0,onibus_01.n_vagas)
	end
	def teste_lugares_vagos
		assert_equal(40,Onibus.new("123","TES0001",40).lugar_vago())
		assert_equal(30,Onibus.new("123","TES0001",30).lugar_vago())
		assert_equal(20,Onibus.new("123","TES0001",20).lugar_vago())
		assert_equal(10,Onibus.new("123","TES0001",10).lugar_vago())
		assert_equal(15,Onibus.new("123","TES0001",15).lugar_vago())
	end
	def teste_vazio
		onibus_01 = Onibus.new("123","TES0001",40)
		assert_equal(true,onibus_01.vazio())
		onibus_02 = Onibus.new("123","TES0001",50)
		assert_equal(true,onibus_01.vazio())
	end
	def teste_subindo_passageiros
		onibus_01 = Onibus.new("123","TES0001",40)
		onibus_01.sobe_passageiro()
		assert_equal(39,onibus_01.lugar_vago())
		assert_equal(false,onibus_01.vazio())
	end
	def teste_descendo_passageiros
		onibus_01 = Onibus.new("123","TES0001",40)
		onibus_01.sobe_passageiro()
		onibus_01.sobe_passageiro()
		onibus_01.desce_passageiro()
		assert_equal(39,onibus_01.lugar_vago())
		assert_equal(false,onibus_01.vazio())
		onibus_01.desce_passageiro()
		assert_equal(true,onibus_01.vazio())
		onibus_01.desce_passageiro()
		assert_equal(true,onibus_01.vazio())
	end
end