require_relative '../config/environment.rb'

class MusicImporter

  attr_accessor :path
 
  def initialize(path)
    @path = path
  end
 
  def files
    Dir.entries(@path).select {|files| files.end_with?(".mp3")}
  end
 
  def import
    files.each {|file_name| Song.create_from_filename(file_name)}.uniq
  end
end