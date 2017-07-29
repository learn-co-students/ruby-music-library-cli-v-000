require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files #loads all mp3 files in path directory
    files = Dir.glob("./#{@path}/*").collect {|file| File.basename("#{file}")}

  end

  def import #imports files into library
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
