class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    @music_library = MusicImporter.new(path).import
  end

  #####
  def call
    puts "Welcome to your music library!"
    input = nil

    until input == "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
    end

  end

  # prints all songs in the music library in a numbered list (alphabetized by song name) - is not hard-coded

  def alpha_song_list
    song_list = Song.all.sort_by!{|song| song.name}
    song_list.uniq #the program much preferred this here than in list_songs
  end

  def list_songs
    alpha_song_list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  # prints all artists in the music library in a numbered list (alphabetized by artist name) - is not hard-coded
  def list_artists
    artist_alpha_list = Artist.all.sort_by{|artist| artist.name.downcase}
    artist_alpha_list.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  # prints all genres in the music library in a numbered list (alphabetized by genre name) - is not hard-coded
  def list_genres
    genre_alpha_list = Genre.all.sort_by{|genre| genre.name}
    genre_alpha_list.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  # prompts the user to enter an artist
  # accepts user input
  # prints all songs by a particular artist in a numbered list (alphabetized by song name)
  # does nothing if no matching artist is found

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip

    artist = Artist.find_by_name(artist_name)

    if (artist)
      artist_songs = artist.songs
      artist_songs.sort_by! {|song| song.name}
      artist_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end

  end

  # prompts the user to enter an genre
  # accepts user input
  # prints all songs by a particular genre in a numbered list (alphabetized by song name)
  # does nothing if no matching genre is found
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)

    if (genre)
      genre_songs = genre.songs
      genre_songs.sort_by! {|song| song.name}
      genre_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end

  end

  # prompts the user to choose a song from the alphabetized list output by #list_songs
  # accepts user input
  # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
  # does not 'puts' anything out if a matching song is not found
  # checks that the user entered a number between 1 and the total number of songs in the library
  def play_song
    puts "Which song number would you like to play?"

    number_input = gets.strip.to_i

    if number_input > 0 && number_input < Song.all.count ## fixed with Song.all instead of list_songs.all

      if alpha_song_list[number_input - 1] != nil
        song = alpha_song_list[number_input - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end

    end

  end

end
