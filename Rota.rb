# coding: utf-8
# criação da Classe Rota
# github.com/carloscuzik

class Rota
	attr_accessor :nome, :horarios, :n_rep
	attr_reader :cod_rota
	def initialize(nome,horarios,n_rep)
		@@cod_rota_geral = 0
		@@cod_rota_geral = @@cod_rota_geral + 1
		@cod_rota = @@cod_rota_geral
		@nome = nome
		@horarios = horarios
		@n_rep = n_rep
	end
end