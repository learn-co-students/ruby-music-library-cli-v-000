class MusicImporter

  attr_reader :files, :path

  def initialize(path)
    @path  = path
    @files = Dir.glob("#{path}/*.mp3").collect { |file| File.basename(file) }
  end

  def import
    @files.each { |file| song = Song.new_from_filename(file) }
  end

  def list_artist(artist_name)
    Artist.list_songs(artist_name)
  end

  def list_artists
    Artist.list_all
  end

  def list_genre(genre_name)
    Genre.list_songs(genre_name)
  end

  def list_genres
    Genre.list_all
  end

  def list_songs
    Song.list_all
  end

  def play_song(song_number)
    Song.play(song_number)
  end
end
