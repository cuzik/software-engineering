# coding: utf-8
# criação da Classe Rota
# github.com/carloscuzik

class Rota
	attr_accessor :id_rt,:nome, :horario, :pontos, :conexao, :distancis_totais
	def initialize(id_rt,nome,horario)
		@id_rt = id_rt
		@nome = nome
		@horario = horario
		@pontos = pontos
	end
	def insere_pontos
		@pontos = @conexao.lista_table("Ponto_Rota","WHERE id_rt = #{@id_rt} ORDER BY pos","id_pt,pos")
	end
	def pega_distancia_ponto_a_ponto
		par_de_pontos = []
		total_pontos = @pontos.length()
		for i in 1...total_pontos
			distancia = @conexao.lista_table("Distancia","WHERE (id_partida = #{@pontos[i-1][0]} AND id_chegada = #{@pontos[i][0]}) OR (id_partida = #{@pontos[i][0]} AND id_chegada = #{@pontos[i-1][0]})","distancia")
			linha = [@pontos[i-1][0],@pontos[i][0],Float(distancia[0][0])]
			par_de_pontos.push(linha)
		end
		@par_de_pontos = par_de_pontos
	end
	def calcula_distancia(id_oni,ponto_destino)
		retorno = @conexao.lista_table("Onibus","WHERE id_oni = #{id_oni}","ponto_proximo")
		ponto_do_onibus = retorno[0][0]
		distancia_restante = 0
		@par_de_pontos.each do |intervalo|
			if intervalo[0] == ponto_do_onibus then
				distancia_restante = distancia_restante + intervalo[2]
				ponto_do_onibus = intervalo[1]
			end
			if(ponto_destino == Integer(intervalo[1])) then
				break
			end
		end
		return distancia_restante
	end
end