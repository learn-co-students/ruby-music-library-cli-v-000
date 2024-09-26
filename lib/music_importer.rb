require 'pry'
class MusicImporter

  attr_accessor :path
  attr_reader :songs 

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).grep(/.mp3/)
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
