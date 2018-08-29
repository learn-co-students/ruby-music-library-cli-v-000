
class MusicLibraryController
  require "pry"
  
  def initialize(path='./db/mp3s')
    @path = path
    @control = MusicImporter.new(path)
    @control.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'." 
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets
    if user_input != "exit"
      call
    else
      return "Exit"
    end 
    
  end
  
  def list_songs
    all_songs = Song.all.sort_by!{ |m| m.name }
    counter = 1
    all_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1 
    end
  end 
  
  def list_artists
    all_artist = Artist.all.sort_by{|a| a.name}
    counter = 1 
    all_artist.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1 
    end 
  end 
  
  def list_genres
    all_genres = Genre.all.sort_by{|a| a.name}
    counter = 1
    all_genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end 
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    found_artist = Artist.find_by_name(user_input)
    if found_artist != nil
      all_songs = found_artist.songs.sort_by {|a| a.name}
      counter = 1 
      all_songs.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter +=1
      end
    end 
  end 
  
   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    found_genre = Genre.find_by_name(user_input)
    if found_genre != nil
      all_songs = found_genre.songs.sort_by {|a| a.name}
      counter = 1 
      all_songs.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter +=1
      end
    end 
  end 
  
  
  def play_song
    puts "Which song number would you like to play?"
    user_input= gets.chomp
    all_songs = Song.all.sort_by!{ |m| m.name }
    if user_input.to_i > 0 && user_input.to_i < all_songs.size
      puts "Playing #{all_songs[user_input.to_i - 1].name} by #{all_songs[user_input.to_i - 1].artist.name}"
  
    end 
  end
  
  def 
  
  
end 