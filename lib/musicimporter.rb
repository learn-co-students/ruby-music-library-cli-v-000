require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path 
    @files = Dir.entries(@path).drop(2)
  end

  def files
    @files
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end



end