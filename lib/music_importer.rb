class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("./#{path}/*.mp3").collect{|file| file.gsub("./#{path}/", '')}
 end

 # def import
 #   files.each do |file|
 #     Song.new_by_filename(file)
 #   end
#end
  def new_from_filename(file)
    file = file.split(" - ")
    artist = file[0]
    song = file[1].gsub(".mp3", "")
    #binding.pry
    new_song = self.new_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.artist.add_song(new_song)
    new_song #want to use tap here


  end
end



#end
#Song.new("Gold and Silver", "Stavesacre")
#binding.pry
