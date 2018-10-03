class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    [ "Welcome to your music library!",
      "To list all of your songs, enter 'list songs'.",
      "To list all of the artists in your library, enter 'list artists'.",
      "To list all of the genres in your library, enter 'list genres'.",
      "To list all of the songs by a particular artist, enter 'list artist'.",
      "To list all of the songs of a particular genre, enter 'list genre'.",
      "To play a song, enter 'play song'.",
      "To quit, type 'exit'."
    ].each { |phrase| puts phrase }

    input = nil
    until input == 'exit'
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.sorted_by_name.each.with_index(1) { |song, i| puts "#{i}. #{song.artist_name} - #{song.name} - #{song.genre_name}" }
  end

  def list_artists
    Artist.sorted_by_name.each.with_index(1) { |artist, i| puts "#{i}. #{artist.name}" }
  end

  def list_genres
    Genre.sorted_by_name.each.with_index(1) { |genre, i| puts "#{i}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    artist = Artist.find_by_name(name)
    artist.sorted_songs.each.with_index(1) { |song, i| puts "#{i}. #{song.name} - #{song.genre_name}" } if artist
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip
    genre = Genre.find_by_name(name)
    genre.sorted_songs.each.with_index(1) { |song, i| puts "#{i}. #{song.artist_name} - #{song.name}" } if genre
  end

  def play_song
    puts "Which song number would you like to play?"
    num = gets.strip.to_i
    if (1..Song.all.size) === num
      song = Song.sorted_by_name[num - 1]
      puts "Playing #{song.name} by #{song.artist_name}" if song
    end
  end
end
