load 'csv_parser.rb'
load 'aluno.rb'
load 'gerador_email.rb'
load 'aluno_finder.rb'


path_csv = "/Users/priscilacaldas/desktop/alunos.csv"


puts "Olá, informe a sua matrícula\n"
matricula = gets.chomp

aluno = Aluno.new(matricula)

if aluno.ativo? && !aluno.tem_uffmail?
	opcoes = GeradorEmail.new(aluno.nome).gerar_opcoes
	
	hash_opcoes = {}
	opcoes.each_with_index do |opcao, index|
		hash_opcoes[index + 1] = opcao
	end

	hash_opcoes.each do |k, v|
		puts "#{k} - #{v}"
	end

	puts "Escolha uma das opcções acima:\n"
	opcao_escolhida = gets.chomp.to_i
	puts "Obrigado! O UFFMail escolhido (#{hash_opcoes[opcao_escolhida]}) será criado dentro dos próximos minutos."

elsif aluno.ativo? && aluno.tem_uffmail?
	puts "Você já tem um UFFMail!"
else
	puts "Desculpe, você não é um aluno ativo, não poderá criar o seu UFFMail :("
end


