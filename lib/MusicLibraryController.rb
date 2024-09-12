require 'pry'
class MusicLibraryController
  attr_accessor :path,:filenames,:title

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

 def greeting
   puts "To list all of your songs, enter 'list songs'."
   # songs
   puts "To list all of the artists in your library, enter 'list artists'."
   # artists
   puts "To list all of the genres in your library, enter 'list genres'."
   # genres
   puts"To list all of the songs by a particular artist, enter 'list artist'."
   # list_artists
   puts"To list all of the songs of a particular genre, enter 'list genre'."
   # list_genres
   puts"To play a song, enter 'play song'."
   # play_song
   puts"To quit, type 'exit'."
 end

  def call
    input = ""
    while input !="exit"
    puts "Welcome to your music library!"
    puts"What would you like to do?"
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
     greeting
     #refactor puts in a greeting method, make case working, do manually what is test is doing with automation
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

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input= gets.strip
    artist = Artist.find_by_name(artist_input)

  if artist
    # binding.pry
    artist.songs.reverse.each_with_index do|song,index|
       puts "#{index+1}. #{song.name} - #{song.genre.name}"
     end
   end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input= gets.strip
    genre = Genre.find_by_name(genre_input)

  if genre
    genre.songs.each_with_index do|song,index|
       puts "#{index+1}. #{song.artist.name} - #{song.name}"
     end
   end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i - 1
    if song_input.between?(1,10)
    song = Song.all.sort_by{|song|song.name}[song_input]
     puts "Playing #{song.name} by #{song.artist.name}" if song
   end
  end

end
# CLI
# Greet the user.
# Ask the user for input.
# Capture and store that input.
# Do something with that input.
