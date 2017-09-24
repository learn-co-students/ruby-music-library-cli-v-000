require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path)[2..10000]
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end