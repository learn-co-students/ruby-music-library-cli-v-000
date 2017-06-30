require 'pry'

class MusicImporter
  attr_accessor :path, :musiclibrarycontroller

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(@path).each do |file|
      if file.include?(".mp3")
        @files << file
      end
    end
    @files
  end

  def import
  files.each do |f|
    Song.create_from_filename(f)
    end
  end

end
