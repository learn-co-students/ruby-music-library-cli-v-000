require 'pry'
class MusicLibraryController
  attr_accessor :path,:filenames,:title

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts"To list all of the songs by a particular artist, enter 'list artist'."
    puts"To list all of the songs of a particular genre, enter 'list genre'."
    puts"To play a song, enter 'play song'."
    puts"To quit, type 'exit'."
    puts"What would you like to do?"
    until "exit"
      # 4.times{path = gets("a", "b", "c", "exit")}
    end
   end

  def list_songs
    song_list = Song.all.sort_by{ |song| song.name}
    song_list.each_with_index do|song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist_list = Artist.all.sort_by{ |artist| artist.name}
    artist_list.each_with_index do|artist,index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by{ |genre| genre.name}
    genre_list.each_with_index do|genre,index|
      puts "#{index+1}. #{genre.name}"
     end
   end

  # def list_songs_by_artist
  #
  #   puts "Please enter the name of an artist:"
  #   artist_input= gets.strip
  #   # ("1. Green Aisles - country")
  #   artist = Artist.find_by_name(artist_input)
  #   # binding.pry
  #   if artist
  #   artist.songs.each_with_index do|song,index|
  #      puts "#{index+1}. #{song.artist.name} - #{song.genre.name}"
  #    end
  # end

end
# CLI
# Greet the user.
# Ask the user for input.
# Capture and store that input.
# Do something with that input.
