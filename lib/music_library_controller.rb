require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @path = path
    mi = MusicImporter.new(path)
    mi.import
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
    Song.all.sort_by{|s| s.name}.each.with_index(1) do |x, i| 
      puts "#{i}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by{|s| s.name}.each.with_index(1) do |x, i| 
      puts "#{i}. #{x.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by{|s| s.name}.each.with_index(1) do |x, i| 
      puts "#{i}. #{x.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort_by{ |x| x.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort_by{ |x| x.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort_by{ |x| x.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end