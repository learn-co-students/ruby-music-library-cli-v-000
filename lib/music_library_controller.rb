class MusicLibraryController

  def initialize(path = './db/mp3s')
    # @path = path
    MusicImporter.new(path).import
  end

  def call
    answer = nil

    while answer != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      answer = gets.strip

      case answer
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end


#-----  TODO  -----#
  def list_songs
    Song.all.sort { |k, v| a.name <=> b.name}.each_with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists

  end

  def list_genres

  end

  def list_artist

  end

  def list_genre

  end

  def play_song

  end


end
