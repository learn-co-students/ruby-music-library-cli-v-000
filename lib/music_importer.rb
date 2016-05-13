class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*.mp3"].collect do |x|
      x.split("/").last
    end
  end

  def import
    files.each{|normalized_song_name| Song.create_from_filename(normalized_song_name)}
  end

end
