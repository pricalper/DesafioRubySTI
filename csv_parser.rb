require 'csv'

class CSVParser

  attr_reader :csv_path
  
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def parse
  	CSV.read(csv_path, headers: true)
  end
end