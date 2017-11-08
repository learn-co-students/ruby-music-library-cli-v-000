class MusicLibraryController

  def initialize(path)
    @path = path
    @music_importer = MusicImporter.new(path)
    #@music_importer.import
  end

  def call
    #welcome
    #ask user for input
    #loops until user types exit
    until input == "exit"
      puts "Enter a song choice"
      input = gets.chomp
    end
  end

  def list_songs
  end

  def list_artists
  end

  def list_genres
  end

  def list_songs_by_artist
  end

  def list_songs_by_genre
  end

  def play_song
  end

end
