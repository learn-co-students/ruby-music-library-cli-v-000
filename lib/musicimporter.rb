class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @@all = []
    Dir.foreach(@path) do |song|
      if song.include?(".mp3")
        @@all << song
      end
    end
    @@all.uniq
 end

 def import
   @@all.each do |file|
     Song.create_from_filename(file)
   end
 end

end
