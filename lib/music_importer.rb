require 'pry'
class MusicImporter
  attr_reader :path 

  def initialize(path)
    @path = path
  end  

  def files
    file = Dir.glob("./spec/fixtures/mp3s/*.mp3").map {|m_file| m_file}
    file = file.join(" ").gsub("./spec/fixtures/mp3s/", "").gsub(".mp3 ", ".mp3, ")
    file = file.split(", ")
    file
  end  

  def import
    files.each{|my_file| Song.create_from_filename(my_file)}
  end  
end


