class MusicImporter
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir.entries(@path).select do |f|
      f.end_with?(".mp3")
    end
  end

  def import
    files.each do |f|
      song = Song.create_from_filename(f)
      # song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      # song.artist.add_song(song)
    end
  end

end
