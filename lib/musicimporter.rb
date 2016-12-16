class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path    
  end

  def files
    Dir.glob("#{path}/*.mp3").each { |s| s.gsub!("#{path}/", "") }
  end

  def import
    # imports all the files from the library and creates the Song objects
    files.each { |s| Song.create_from_filename(s) }
  end
end