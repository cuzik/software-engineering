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
	def consulta_rotas(ponto_destino)# falta fazer
		#consultara todas as rotas que passam pelo ponto passado como parametro
		return true
	end
	def hora_da_rota(rota_selecionada)# falta fazer
		#mostra a próxima hora que algum onibos vai passar pela rota
		return
	end
	def onibus_disponiveis(destino)
		retorno = @conexao.lista_table("Ponto_Rota p1 JOIN Ponto_Rota p2 ON p1.id_pt = #{@ponto_atual} AND p2.id_pt = #{destino} AND p1.id_rt = p2.id_rt AND p1.pos < p2.pos JOIN Rota r ON r.id_rt = p1.id_rt","","r.id_rt,r.nome")
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
		retorno = @conexao.lista_table("Alocado a JOIN Rota r ON a.id_rt = r.id_rt","WHERE a.hora_saida > '13:00:00' AND a.id_rt IN (#{rotas_possiveis}) ORDER BY a.hora_saida","*")
		return retorno
	end
end