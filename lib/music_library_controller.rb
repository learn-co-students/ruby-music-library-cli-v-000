require 'pry'
class MusicLibraryController
  attr_reader :music_importer, :song, :music_library_controller

  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    loop do
      puts "What would you like to do?"
      user_input = gets.chomp
      case user_input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      when 'exit'
        break
      end
    end
  end

  def list_songs
      Song.alpha_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    @artist_list = []
    Artist.alpha_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
      @artist_list << artist
    end
  end

  def list_genres
    @genre_list = []
    Genre.alpha_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
    @genre_list
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    Artist.all.select do |artist|   # iterate thru Artist.all array
      if artist.name == user_input
        user_artist_songs = artist.songs.sort {|a, b| a.name <=> b.name}
        user_artist_songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    Genre.all.select do |genre|
      if genre.name == user_input
       user_genre_songs = genre.songs.sort {|a, b| a.name <=> b.name}
       user_genre_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i

    if (1..Song.alpha_songs.length).include?(user_input)
      s =  Song.alpha_songs[user_input - 1]
      puts "Playing #{s.name} by #{s.artist.name}"
    end
  end
end
