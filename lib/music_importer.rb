require 'pry'
class MusicImporter
  
  attr_accessor :path, :name, :artist, :genre
 
  def initialize(path)
    @path = path
  end
  
  def files
   var = Dir.entries(path)
   var.delete_if do |i|
    i == "." || i == ".."

  end
  end
  
  def import
    files_for_import = self.files
    files_for_import.each do |i|
      new_song = Song.create_from_filename(i)
    end
    # new_file = Song.create_from_filename(filename)
    # - BUILDS A SONG INSTANCE OUT OF EACH FILE
    # - imports files into library
    # - invokes Song.create_from_filename
    # the files method sort of imports them into file names so what import really does is imports them into the ruby world as instances instead of just strings/names
  end
    
  
end 
