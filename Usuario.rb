# coding: utf-8
# criação da Classe Usuario
# github.com/carloscuzik

require_relative "Rota"
require_relative "Ponto"
require_relative "Conexao"

class Usuario
	attr_accessor :cpf, :nome, :ponto_atual, :conexao
	attr_reader :cod_user
	def initialize(id,cpf,nome)
		@cod_user = id
		@cpf = cpf
		@nome = nome
	end
	def onibus_disponiveis(destino)
		retorno = @conexao.lista_table("Ponto_Rota p1 JOIN Ponto_Rota p2 ON p1.id_pt = #{@ponto_atual} AND p2.id_pt = #{destino} AND p1.id_rt = p2.id_rt AND p1.pos < p2.pos JOIN Rota r ON r.id_rt = p1.id_rt","","DISTINCT r.id_rt,r.nome")
		return retorno;
	end
	def onibus_melhor(oni)
		rotas_possiveis = ""
		count = oni.length()
		oni.each do |linha|
			rotas_possiveis << "#{linha[0]}"
			count -= 1
			if(count!=0) then
				rotas_possiveis << ","
			end
		end
		hora = @conexao.lista_table("hora","","*")
		retorno = @conexao.lista_table("Alocado a JOIN Rota r ON a.id_rt = r.id_rt","WHERE a.id_rt IN (#{rotas_possiveis}) AND hora_chegada > '#{hora[0][0]}' ORDER BY a.hora_saida","*")
		return primeiro_que_nao_passo(retorno)
	end
	def proximo_onibus(rota)
		hora = @conexao.lista_table("hora","","*")
		retorno = @conexao.lista_table("Alocado a JOIN Rota r ON a.id_rt = r.id_rt","WHERE a.id_rt IN (#{rota}) AND hora_chegada > '#{hora[0][0]}' ORDER BY a.hora_saida","*")
		return primeiro_que_nao_passo(retorno)
	end
	def primeiro_que_nao_passo(retorno)
		retorno.each do |linha|
			@rota = Rota.new(linha[0],linha[4],linha[2])
			@rota.conexao = Conexao.new("root","cuzik40e3","localhost","MindBus")
			@rota.conexao.conectar
			@rota.conexao.sleciona_db
			@rota.insere_pontos
			@rota.pega_distancia_ponto_a_ponto
			distancia_restante = @rota.calcula_distancia(linha[1],@ponto_atual)
			#puts distancia_restante
			if distancia_restante > 0 then
				return linha
			end
		end
		@rota.conexao.fecha_db
		return []
	end
	def tempo_restante(id_oni,distancia_restante)
		vel_med_oni = @conexao.lista_table("Onibus","WHERE id_oni = #{id_oni}","velocidade_media")
		if Float(vel_med_oni[0][0]) == 0 then
			return 0
		end
		return Float(distancia_restante) * 60 / Float(vel_med_oni[0][0])
	end
end