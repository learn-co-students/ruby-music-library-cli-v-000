require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    files.each{ |f| Song.create_from_filename(f)}
    # binding.pry
  end
end
