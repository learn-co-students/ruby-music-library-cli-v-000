require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    #binding.pry
    MusicImporter.new(path).import
  end
  
  def call
    input = ""
    until input == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    #binding.pry
   Song.all.sort {|song1, song2| song1.name <=> song2.name}.each_with_index do |song, index|
     puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort {|artist1, artist2| artist1.name <=> artist2.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort {|genre1, genre2| genre1.name <=> genre2.name}.each_with_index do |genre, index| 
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by{|artist_name| artist_name.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end  
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by{|genre_name| genre_name.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort { |a, b| a.name <=> b.name }[input - 1]
      # binding.pry
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end