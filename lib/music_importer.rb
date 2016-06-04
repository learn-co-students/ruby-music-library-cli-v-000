require 'pry'
class MusicImporter
  attr_accessor :path, :MusicImporter

    def initialize(path)
    @path = path
    @MusicImporter = MusicImporter
    @files = files
  end

  def files
    @files = Dir.entries(@path).select {|file| file.size >= 5}

  end

  def import
    @files.each {|filename| Song.create_from_filename(filename)}

  end

end