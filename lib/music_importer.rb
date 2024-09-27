class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    files.collect { |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|f| Song.create_from_filename(f) }
  end
end
