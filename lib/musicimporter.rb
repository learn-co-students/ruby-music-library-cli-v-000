require'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    files = files.select {|file| file.end_with?(".mp3")}
    files
  end


end