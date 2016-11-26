# coding: utf-8
# criação da Classe Administrador
# github.com/carloscuzik

require_relative "Onibus"
require_relative "Rota"
require_relative "Ponto"
require_relative "Conexao"

class Administrador
	attr_accessor :cpf, :nome, :conexao
	attr_reader :cod_adm
	def initialize(id,cpf,nome)
		@cod_adm = id
		@cpf = cpf
		@nome = nome
	end
	#inserção de novos elementos
	def inserir_onibus(id_oni,placa,n_vagas,la,lo)
		retorno = @conexao.inserir("Onibus","#{id_oni},'#{placa}',#{n_vagas},#{lo},#{la}")
		if(!retorno) then
			return false
		end
		return true
	end
	#exclusão de elemento
	def excluir_onibus(old_onibus)
		# vai excluir um onibus que foi passado como parametro
		return true
	end
end
