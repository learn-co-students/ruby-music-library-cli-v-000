class MusicImporter
  attr_accessor :path
  
  @@list = []
  
  def initialize(path)
    @path = path
  end
  
  def files
    @@list = []
    file = Dir.entries(@path)
    file.each do |song|
      if song.end_with? ".mp3"
        @@list << song
      end
    end
    @@list
  end
  
  def import
    files.collect { |file| Song.create_from_filename(file) }
  end
end