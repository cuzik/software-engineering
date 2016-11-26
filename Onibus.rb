# coding: utf-8
# criação da Classe Onibus
# github.com/carloscuzik

class Onibus
	attr_accessor :codGPS, :placa, :vlc_atual, :la, :lo, :conexao
	attr_reader :n_vagas, :lmt_vagas
	def initialize(codGPS,placa,lmt_vagas,la,lo)
		@vlc_atual = 60
		@codGPS = codGPS
		@placa = placa
		@n_vagas = lmt_vagas
		@lmt_vagas = lmt_vagas
		@la = la
		@lo = lo
		@ponto_proximo = 21
	end
	def lugar_vago
		return @n_vagas
	end
	def sobe_passageiro
		@n_vagas = @n_vagas - 1
	end
	def desce_passageiro
		if vazio()
			puts "onibus ja esta vazio"
		else
			@n_vagas = @n_vagas + 1
		end
	end
	def vazio()
		return (@n_vagas == @lmt_vagas)
	end
	def atualiza_localizacao(pt)
		retorno = @conexao.lista_table("Ponto","WHERE id_pt = #{pt}","*")
		@la = retorno[0][1]
		@lo = retorno[0][2]
		@ponto_proximo = pt
		@conexao.atualizar("Onibus","LA = #{@la}, LO = #{@lo}, ponto_proximo = #{@ponto_proximo}","WHERE id_oni = #{@codGPS}")
	end
	def atualiza_velocidade(vel)
		@vlc_atual = vel
		@conexao.atualizar("Onibus","velocidade_media = #{@vlc_atual}","WHERE id_oni = #{@codGPS}")
	end
	def atualiza_passageiros
		@conexao.atualizar("Onibus","n_vagas = #{@n_vagas}","WHERE id_oni = #{@codGPS}")
	end
end