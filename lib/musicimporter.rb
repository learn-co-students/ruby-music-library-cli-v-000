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

  def import
    files.each {|s| Song.create_from_filename(s)}
  end


end