require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files.collect do |f|
      if f.include?(".mp3")
        f
      end
    end.compact
  end
### look up Dir.glob ###
  def import
    files.each do |f|
      Song.create_from_filename(f)
    end
  end

end
