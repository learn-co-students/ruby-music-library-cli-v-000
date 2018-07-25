# require 'song' 
# require 'artist'
# require 'music_importer'

class MusicLibraryController
  
  attr_reader :path
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
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
        return
      else
        puts "You entered #{user_input}, this is not one of the options we have."
        call
    end
  end 
  
  def list_songs
    # binding.pry
    Song.all.uniq.sort_by {|song| song.name}.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    
  end
  
  def list_artists
    Artist.all.sort_by {|a| a.name}.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by {|g| g.name}.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    a = gets.chomp 
    Song.all.uniq.select {|s| s.artist.name == a}.sort_by {|s| s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.name} - #{song.genre.name}"
    end
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    g = gets.chomp 
    Song.all.uniq.select {|s| s.genre.name == g}.sort_by {|s| s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name}"
    end
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    n = gets.strip.to_i 
    sorted = Song.all.uniq.sort_by {|song| song.name}
	  if n.between?(1, sorted.length)
        i = n - 1
        song = sorted[i]
        puts "Playing #{song.name} by #{song.artist.name}" if song
    end 
	end  
  
end







