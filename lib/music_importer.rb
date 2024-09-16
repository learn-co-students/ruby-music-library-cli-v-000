class MusicImporter

  attr_accessor :path, :files

  def initialize(path)

    self.path = path
  
  end

  def files
    #Returns an array of every element with pattern mp3
    array_of_MP3 = Dir.entries(self.path).grep(/mp3/)
  end

  def import 
   
   files.each{|filename| Song.create_from_filename(filename)}
   
 end
end