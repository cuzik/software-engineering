# coding: utf-8
# criação da Classe Usuario
# github.com/carloscuzik

require_relative "Rota"
require_relative "Ponto"

class Usuario
	@senha = ""
	attr_accessor :cpf, :nome, :ponto_atual
	attr_reader :cod_user
	def initialize(id,cpf,nome,senha)
		@cod_user = id
		@senha = senha
		@cpf = cpf
		@nome = nome
	end
	def consulta_rotas(ponto_destino)# falta fazer
		#consultara todas as rotas que passam pelo ponto passado como parametro
		return true
	end
	def hora_da_rota(rota_selecionada)# falta fazer
		#mostra a próxima hora que algum onibos vai passar pela rota
		return
	end
end