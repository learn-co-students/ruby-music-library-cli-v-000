require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select{|entry| entry[/\.mp3$/]} #could possibly be more eloquent
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end


end
