require 'pry'

class MusicImporter
  extend Concerns::Findable

  attr_accessor :files, :path
  

  def initialize(path)
    @path = path    
    # Song.new_from_filename()
  end 

  def files
     Dir.entries(path).select{|file| file.end_with?(".mp3")}
  end 

  def import
    files.each {|file| Song.new_from_filename(file)}
  end

end 