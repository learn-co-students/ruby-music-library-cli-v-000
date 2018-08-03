
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select do |file_name|
      file_name.include? "mp3"
    end
    @files
  end

end
