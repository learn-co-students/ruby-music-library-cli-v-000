class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    welcome
    user_input
  end

  def welcome
    puts "Welcome to your music library!"
    puts "What would you like to do?"
  end

  def menu
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
  end

  def user_input
    menu
    input = nil
    while input != 'exit'
      input = gets.chomp
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

  def alphabetize(array)
    array.sort { |a, b| a.name <=> b.name }
  end

  def list_songs
    alphabetize(Song.all).each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    alphabetize(Artist.all).each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    alphabetize(Genre.all).each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    songs = Song.all.select {|s| s.artist.name == artist_name }
    alphabetize(songs).each_with_index {|s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}" }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    songs = Song.all.select {|s| s.genre.name == genre_name }
    alphabetize(songs).each_with_index {|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}" }
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number > 0 && song_number <= Song.all.length
      song_number -= 1
      song = alphabetize(Song.all)[song_number]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
