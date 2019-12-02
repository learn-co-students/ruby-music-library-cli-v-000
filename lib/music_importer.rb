class MusicImporter
  
  attr_reader :path, :files
  
  def initialize(path)
    @path = path
    @files = Dir.glob(path + "/*.mp3")
    @files.each { |f| f.gsub!(path + "/", "") }
  end
  
  def import
    @files.each { |f| Song.create_from_filename(f) }
  end
  
end