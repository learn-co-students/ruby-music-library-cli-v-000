class MusicImporter
  attr_reader :path
  
  def initialize(music_path)
    @music_path = music_path
  end

  def path
    @music_path
  end

  def files
    Dir.entries(self.path).map do |file|
      file.match(/^.+\.mp3$/) ? file : nil
    end.compact 
  end

  def import
    self.files.each do |filename|
      artist, song, genre = filename.split(" - ")
      
      new_song = Song.find_or_create_by_name(song)
      new_song.artist = Artist.find_or_create_by_name(artist)
      new_song.genre = Genre.find_or_create_by_name(genre.gsub(/\.mp3/, ""))
    end
  end

end