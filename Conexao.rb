# coding: utf-8
# arquivo com a classe de conexão padrão com o mysql
# github.com/carloscuzik

require 'mysql'

class Conexao
	attr_reader :user_mysql, :host_mysql, :database_mysql
	def initialize(root,pass,localhost,name_bd)
		@user_mysql = root
		@pass_mysql = pass
		@host_mysql = localhost
		@database_mysql = name_bd
	end
	def conectar
		@mydb = Mysql.new(@host_mysql,@user_mysql,@pass_mysql)
	end
	def sleciona_db
		@mydb.select_db(@database_mysql)
	end
	def lista_table(table,condicao="",col_ret="*")
		@list = @mydb.query("SELECT #{col_ret} FROM #{table} #{condicao}")
		labes = @list.fetch_fields
		n_cols = @mydb.field_count
		labels = []
		retorno = []
		labes.each do |linha|
			labels.push(linha.name)
		end
		@list.each_hash do |row|
			buffer = []
			row.each do |a|
				buffer.push(a[1])
			end
			retorno.push(buffer)
		end
		return retorno
	end
	def query(table,condicao="",col_ret="*")
		return @mydb.query("SELECT #{col_ret} FROM #{table} #{condicao}")
	end
	def inserir(table,values)
		@mydb.query("INSERT INTO #{table} VALUES(#{values});")
	end
	def deletar(table,condicao)
		@mydb.query("DELETE FROM #{table} #{condicao}")
	end
	def fecha_db
		@mydb.close
	end
end

#db1 = Conexao.new("root","cuzik40e3","localhost","teste01")
#db1.conectar
#db1.sleciona_db
#retorno = db1.lista_table("aluno")
#retorno.each do |linha|
#	puts "#{linha[0]} => #{linha[1]} => #{linha[2]}"
#end
#db1.deletar("aluno","WHERE codAluno > 12 AND codAluno < 87")
#db1.inserir("aluno","null,'Carlos_06','12334554321'")
#db1.fecha_db