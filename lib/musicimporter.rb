require "pry"

class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path =path
  end
  def path
    @path
  end
  def files
    array=Dir.entries(@path)
    array=array.grep(/.mp3/)
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
