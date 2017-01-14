class MusicImporter
  attr_accessor :path, :file, :name

  def initialize(path = "./db/mp3s")
    @path = path 
    @files = []
  end

  def files
    Dir.glob("./spec/fixtures/mp3s/*.mp3").collect do |filename|
      @files << filename
    end
    @files.each { |file| file.slice! ("./spec/fixtures/mp3s/") }
    #Song.new_from_filename(file)
  end

  def import
    files.each { |s| Song.new_from_filename(s) }
  end


end
