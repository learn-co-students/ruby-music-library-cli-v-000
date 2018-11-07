class MusicImporter
  
  attr_accessor :path, :name, :artist, :mp3
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    Dir.entries(@path).select {|file| file.include?(".mp3")}
  end
  
  def import
    Song.new_from_filename(song_name, artist, genre)
    Song.create_from_filename(file_path)
     
  end
end
     
  
     
 
  #   Song.create_from_filename("./spec/fixtures/mp3s")
  #   binding.pry
  # MusicImporter.new("./spec/fixtures/mp3s")

       

# #   def import
# #     files.each { |file| file = Song.new_by_filename(}
    
  

# # #files returns an array of all mp3's 
# #create a new song by $FILENAME pass
