require "pry"

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  #CALL METHOD
  # ----------

  def call
    puts "Welcome to your music library!"

    help

    loop do
      puts "What would you like to do?"
      command = gets.strip.downcase.to_sym

      case command
      when :exit
        break
      when :help
        help
      when :"list songs"
        list_songs
      when :"list artists"
        list_artists
      when :"list genres"
        list_genres
      when :"list artist"
        list_songs_by_artist
      when :"list genre"
        list_songs_by_genre
      when :"play song"
        play_song
      else
        puts "Invalid command, please try again."
      end

    end
  end



  # CLI METHODS
  # -----------

  def help
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
  end

  def list_songs
    # when gets.chomp.strip == "list songs"
    Song.all.sort.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist} - #{song} - #{song.genre}"
    end
  end

  def list_artists
    sorted_artist = Artist.all.sort
    sorted_artist.each_with_index { |artist, i| puts "#{i + 1}. #{artist}" }
  end

  def list_genres
    sorted_genre = Genre.all.sort
    sorted_genre.each_with_index { |genre, i| puts "#{i + 1}. #{genre}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    # String#downcaseonly works on English, ya jamoke
    Song.all
      .find_all { |song| song.artist.name.downcase == artist_name.downcase }
      .sort
      .each_with_index { |song, i| puts "#{i + 1}. #{song} - #{song.genre}" }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    # String#downcaseonly works on English, ya jamoke
    Song.all
      .find_all { |song| song.genre.name.downcase == genre_name.downcase }
      .sort
      .each_with_index { |song, i| puts "#{i + 1}. #{song.artist} - #{song}" }
  end

  def play_song
    puts "Which song number would you like to play?"
    song_ordinal = gets.strip.to_i
    song_index = song_ordinal - 1

    # the highest index will be *ONE* less the number of entries!!
    last_index = Song.all.sort.length - 1
    if song_index.between?(1, last_index)
      puts "Playing #{Song.all.sort[song_index].name} by #{Song.all.sort[song_index].artist.name}"
    end
  end

end #MusicLibraryController
