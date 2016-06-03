require 'pry'
class MusicImporter
  attr_accessor :path, :MusicImporter

    def initialize(path)
    @path = path
    @MusicImporter = MusicImporter
    @files = files
 # binding.pry
  end

  def files
    @files = Dir.entries(@path).select {|file| file.size >= 5}
  #binding.pry
  end

  def import
    @files.each {|filename| Song.create_from_filename(filename)}
  binding.pry
  end

end