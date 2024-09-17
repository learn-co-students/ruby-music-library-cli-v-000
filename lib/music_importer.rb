class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end

  def files
    songs = Dir["#{@path}/*"]

    songs.map do |song|
      File.basename(song)
    end 
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end 