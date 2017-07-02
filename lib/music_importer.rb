require 'pry'

class MusicImporter
  attr_reader :path # getter

  def initialize(path) #setter
    @path = path
  end

  def files # method stores files (without path) in @files variable as an array
    @files = Dir["#{path}/*.mp3"].collect do |file|
      File.basename(file)
      #binding.pry
    end
    #binding.pry
  end

  def import
    files.sort.each do |file_name| # had to use #.sort method to sort by artist name
      Song.create_from_filename(file_name)
    end
  end
end

#test_path = "./spec/fixtures/mp3s"
#music_importer = MusicImporter.new(test_path)
#music_importer.files
#music_importer.import
