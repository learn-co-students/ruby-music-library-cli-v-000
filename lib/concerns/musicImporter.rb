class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path 
    @files = Dir.entries(path).select { |el| el.include?(".mp3")}
  end

end