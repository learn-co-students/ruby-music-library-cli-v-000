class MusicImporter

  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    @songs = []
    Dir.foreach(@path) do |song|
      if song.include?(".mp3")
        @songs << song
      end
    end
    @songs.uniq
 end

 def import
   files.each do |file|
     Song.create_from_filename(file)
   end
 end

end
