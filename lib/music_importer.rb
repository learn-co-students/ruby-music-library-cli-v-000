class MusicImporter
  attr_accessor :path, :filename

  def initialize(path)
    @path = "./spec/fixtures/mp3s"
    @files = []
  end

  def files
    Dir.glob("./spec/fixtures/mp3s/*.mp3").collect do |filename|
      @files << filename
    end
    @files.each { |file| file.slice! ("./spec/fixtures/mp3s/") }
  end


end
