load 'aluno_finder.rb'

class Aluno 
  attr_reader :matricula

  CAMINHO_CSV = "/Users/priscilacaldas/desktop/alunos.csv"
  
  def initialize(matricula)
    @matricula = matricula
  end

  def to_s
  	AlunoFinder.new(CAMINHO_CSV, @matricula).encontra_aluno
  end

  def nome
  	if aluno_existe?
  		self.to_s["nome"]
  	end
  end

  def ativo?
  	if aluno_existe?
  		self.to_s["status"] == 'Ativo'
  	end
  end

  def tem_uffmail?
  	if aluno_existe?
  		!self.to_s["uffmail"].nil?
  	end
  end

  private
  def aluno_existe?
  	aluno = AlunoFinder.new(CAMINHO_CSV, @matricula).encontra_aluno
  	aluno.nil? ? false : true
  end
end