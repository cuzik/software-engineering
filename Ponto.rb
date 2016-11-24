# coding: utf-8
# criação da Classe Ponto
# github.com/carloscuzik

class Ponto
	attr_accessor :endereco, :la, :lo
	attr_reader :cod_pt
	def initialize(id,la,lo)
		@cod_pt = id
		@la = la
		@lo = lo
	end
end