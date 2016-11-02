# coding: utf-8
# criação da Classe Onibus
# github.com/carloscuzik

class Onibus
	attr_accessor :codGPS, :placa, :lmt_vagas, :vlc_atual
	attr_reader :n_vagas
	def initialize(codGPS,placa,lmt_vagas)
		@vlc_atual = 0
		@codGPS = codGPS
		@placa = placa
		@n_vagas = 0
		@lmt_vagas = lmt_vagas
	end
	def lugar_vago()
		return @lmt_vagas - @n_vagas
	end
	def sobe_passageiro()
		@n_vagas = @n_vagas + 1
	end
	def desce_passageiro()
		if vazio()
			puts "onibus ja esta vazio"
		else
			@n_vagas = @n_vagas - 1
		end
	end
	def vazio()
		return (@n_vagas == 0)
	end
end