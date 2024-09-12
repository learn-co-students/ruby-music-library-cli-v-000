require "pry"

class MusicImporter
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.entries(self.path).reject{|entry| File.directory? entry}
    # The reject statement gets rid of the "." and ".." in Dir.entries(self.path)
    # Check out the Collaborating Objects Lab for other solutions.
  end 
  
  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end