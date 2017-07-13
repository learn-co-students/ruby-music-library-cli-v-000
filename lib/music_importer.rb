require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = []
    Dir.entries(@path).each { |file| files << file if file.end_with?("mp3") }
    files
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end


end
