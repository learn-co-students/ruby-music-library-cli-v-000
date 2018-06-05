require 'pry'

class MusicLibraryController

  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    #greet the user
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "What would you like to do?"
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
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
    Song.sorted.each.with_index(1) {|song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.sorted.each.with_index(1) {|artist, index| puts "#{index}. #{artist.name}"}
  end

  def list_genres
    Genre.sorted.each.with_index(1) {|genre, index| puts "#{index}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort {|a, b| a.name <=> b.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end
  end
  #binding.pry

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort {|a, b| a.name <=> b.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end
  end


#prompts the user to choose a song from the alphabetized list output by #list_songs
#accepts user input
#upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
#does not 'puts' anything out if a matching song is not found
#checks that the user entered a number between 1 and the total number of songs in the library

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    if (1..Song.all.length).include?(input)
      song = Song.sorted[input]
    end

    puts "Playing #{song.name} by #{song.artist.name}" 
  end

end
