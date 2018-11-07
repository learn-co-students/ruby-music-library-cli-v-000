class MusicImporter
  
  attr_accessor :path, :name, :artist, :mp3
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    Dir.entries(@path).select {|file| file.include?(".mp3")}
  end
end
  
#   def Song.new_from_filename(file_path)
#     array = file_path.split (" - ")
      
#       song = array[0]   
#       artist = array[1] 
#       genre = array[2] 
#       #mp3 = array[3]
#         #binding.pry
#         song.name 
       
#   end
  
#   def import
#     files.each { |file| file = Song.new_by_filename}
#   end
  
# end


  
# #   def import
# #     files.each { |file| file = Song.new_by_filename}
    
  
# #   end  
# # end
# # #files returns an array of all mp3's 
# #create a new song by $FILENAME pass
