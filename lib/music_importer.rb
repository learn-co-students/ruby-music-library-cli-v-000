require "pry"

class MusicImporter
  
  attr_accessor :files, :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    @files = Dir.glob(@path + "/*.mp3")
    @files.each{|song| song.slice!(0, 21)}
  end
  
  def import 
    files = self.files
    files.each{|filename| Song.create_from_filename(filename)}
  end
  
end