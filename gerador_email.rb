class GeradorEmail
  attr_accessor :nome

  def initialize(nome)
  	@nome = nome
  end

  def gerar_opcoes
  	opcoes = []
  	@nome.downcase.split.each do |opcao|
  		opcoes << "#{opcao}@id.uff.br"
  	end
  	opcoes
  end
end