load 'csv_parser.rb'

class AlunoFinder

	attr_reader :csv_path, :matricula
	
	def initialize(csv_path, matricula)
		@csv_path = csv_path
		@matricula = matricula
	end

	def encontra_aluno
		parsed_csv = CSVParser.new(@csv_path).parse
		parsed_csv.each do |aluno|
			if aluno["matricula"] == @matricula
				return aluno
				break
			end
		end
		nil
	end
end