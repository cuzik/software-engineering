# coding: utf-8
# criação da Classe Rota
# github.com/carloscuzik

class Rota
	attr_accessor :nome, :n_rep
	attr_reader :cod_rota
	def initialize(id,nome,n_rep)
		@cod_rota = id
		@nome = nome
	end
end