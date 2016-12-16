class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path    
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect { |s| s.gsub("#{path}/", "") }
  end

  def import
    # imports all the files from the library and creates the Song objects
    files.each { |s| Song.create_from_filename(s) }
  end
end