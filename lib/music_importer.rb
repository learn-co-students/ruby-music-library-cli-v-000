require 'pry'
class MusicImporter
  attr_reader :path
  attr_accessor :file_list

  def initialize(path)
    @path = path
  end

  def files
    self.file_list = Dir.entries(self.path).select {|f| f.match(/(.mp3)/)}
  end

  def import
    self.files.each {|f| Song.create_from_filename(f)} 
  end
end
