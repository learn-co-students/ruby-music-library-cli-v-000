class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    @music_library = MusicImporter.new(path).import
  end

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
      i = gets.strip
      cli_commands(i)
    end

  end

  def cli_commands(i)

    if i == "list songs"
      list_songs
    elsif i == "list artists"
      list_artists
    elsif i == "list genres"
      list_genres
    elsif i == "list artist"
      list_songs_by_artist
    elsif i == "list genre"
      list_songs_by_genre
    elsif i == "play song"
      play_song
    elsif i == "exit"
      exit
    end

  end

  #Or as a case statement
#  def cli_commands(i)
#    case input
#       when "list songs"
#         list_songs
#       when "list artists"
#         list_artists
#       when "list genres"
#         list_genres
#       when "list artist"
#         list_songs_by_artist
#       when "list genre"
#         list_songs_by_genre
#       when "play song"
#         play_song
#       end
#     end

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
    i = gets.strip

    if artist = Artist.find_by_name(i)
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
    i = gets.strip

    if genre = Genre.find_by_name(i)
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

    i = gets.strip.to_i

    if i > 0 && i < Song.all.count ## fixed with Song.all instead of list_songs.all

      if alpha_song_list[i - 1] != nil
        song = alpha_song_list[i - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end

    end
  end
end
