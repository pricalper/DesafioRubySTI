load 'aluno_finder.rb'

class Aluno 
  attr_reader :matricula
  
  def initialize(matricula)
    @matricula = matricula
  end

  def to_s
  	AlunoFinder.new("/Users/priscilacaldas/desktop/alunos.csv", @matricula).encontra_aluno
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
  	aluno = AlunoFinder.new("/Users/priscilacaldas/desktop/alunos.csv", @matricula).encontra_aluno
  	aluno.nil? ? false : true
  end
end