class MusicImporter
attr_accessor :path
attr_reader :files
  
  def initialize(path)
  @path = path
  end 
  
  def files
    @files = []
    directory = Dir.open path 
    directory.each do |song|
      if song.match(/mp3/) != nil
       @files << song
    end
  end
    @files
  end
  
  def import
    files.each do |file|
    Song.create_from_filename(file)
  end
  end
  
end