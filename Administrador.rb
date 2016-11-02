# coding: utf-8
# criação da Classe Administrador
# github.com/carloscuzik

require_relative "Onibus"
require_relative "Rota"
require_relative "Ponto"

class Administrador
	@senha = ""
	attr_accessor :cpf, :nome
	attr_reader :cod_adm
	def initialize(cpf,nome,senha)
		@@cod_adm_geral = 0 # consertar isso aqui
		@@cod_adm_geral = @@cod_adm_geral + 1
		@cod_adm = @@cod_adm_geral
		@senha = senha
		@cpf = cpf
		@nome = nome
	end

	#inserção de novos elementos
	def inserir_onibus(new_onibus) # fala fazer
		# vai inserir um novo onibus que foi passado como parametro
		return true
	end
	def inserir_rota(new_rota) # fala fazer
		# vai inserir um novo rota que foi passado como parametro
		return true
	end
	def inserir_ponto(new_ponto) # fala fazer
		# vai inserir um novo ponot que foi passado como parametro
		return true
	end
        
	#exclusão de elemento
	def excluir_onibus(old_onibus) # fala fazer
		# vai excluir um onibus que foi passado como parametro
		return true
	end
	def excluir_rota(old_rota) # fala fazer
		# vai excluir um rota que foi passado como parametro
		return true
	end
	def excluir_ponto(old_ponto) # fala fazer
		# vai excluir um ponot que foi passado como parametro
		return true
	end
end
