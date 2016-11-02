# coding: utf-8
# criação da Classe Ponto
# github.com/carloscuzik

class Ponto
	attr_accessor :endereco
	attr_reader :cod_pt
	def initialize(endereco)
		@@cod_ponto_geral = 0
		@@cod_ponto_geral = @@cod_ponto_geral + 1
		@cod_pt = @@cod_ponto_geral
		@endereco = endereco
	end
end