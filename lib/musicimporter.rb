# require 'pry'
class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end 
  
  #Returns all the imported filenames
  def files
    Dir.each_child(path).map{|filename| filename}
  end
  
#   # ++++++++++++++++++++++++++++++++++++++++++++++
  
  # def self.create_from_filename(file)
  #   song = self.new_from_filename(file)
  #   song.save
  # end  
  
  def import
    self.files.each {|files| Song.create_from_filename(files)}
  end

end
