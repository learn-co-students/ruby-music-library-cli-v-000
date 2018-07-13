require 'pry'
class  MusicLibraryController
  attr_accessor :path

  def initialize(path ='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    while user_input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip
    if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
    end
  end
end


  def list_songs
    sorted_songs = Song.all.sort_by {|song|song.name}
    sorted_songs.each do |song|
      #binding.pry
      puts "#{sorted_songs.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort {|a, b| a.name <=> b.name}
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      sorted_songs_by_artist = artist.songs.sort{ |a, b| a.name <=> b.name}
      sorted_songs_by_artist.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      sorted_songs_by_genre = genre.songs.sort{ |a, b| a.name <=> b.name}
      sorted_songs_by_genre.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
    if user_input > 0 && user_input < Song.all.length + 1
      song = Song.all.sort_by {|song|song.name}[user_input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
