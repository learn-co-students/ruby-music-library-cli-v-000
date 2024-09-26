require "pry"

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).keep_if {|file| file.match(/(mp3$)/)}
  end

  def import
    self.files.map {|file_name| Song.create_from_filename(file_name)}
  end

end

# Stop pry