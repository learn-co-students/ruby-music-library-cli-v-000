require 'pry'

class MusicImporter

  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|filename| filename.end_with?(".mp3")}
  end

  def import
    files.each {|filename|Song.new_from_filename(filename)}
  end

end