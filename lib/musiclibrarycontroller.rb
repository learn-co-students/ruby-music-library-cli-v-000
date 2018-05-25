require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call
    
    ip = ""
    
    while ip != "exit"
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    ip = gets.strip
    
    if ip == "list songs"
      list_songs
      
    elsif ip == "list artists"
      list_artists
      
    elsif ip == "list genres"
      list_genres
      
    elsif ip == "list artist"
      list_songs_by_artist
      
    elsif ip == "list genre"
      list_songs_by_genre
      
    elsif ip == "play song"
      play_song
      
    elsif ip == "exit"
    end
    
    end
    
  end
  
  def list_songs
    
  sorted_songs = []
  sorted_songs = Song.all
  sorted_songs = sorted_songs.sort_by {|song| song.name}
  #binding.pry
  n = 1
  sorted_songs.collect do |song|
    puts "#{n}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    n = n + 1
  end
    
  end
  
  def list_artists
  sorted_artists = []
  sorted_artists = Artist.all
  sorted_artists = sorted_artists.sort_by {|artist| artist.name}
  n = 1
  sorted_artists.each do |artist|
    puts "#{n}. #{artist.name}"
    n = n + 1
  end
  end
  
  def list_genres
  sorted_genres = []
  sorted_genres = Genre.all
  sorted_genres = sorted_genres.sort_by {|genre| genre.name}
  n = 1
  sorted_genres.each do |genre|
    puts "#{n}. #{genre.name}"
    n = n + 1
  end 
  end
  
  def list_songs_by_artist
  puts "Please enter the name of an artist:"
  ip = gets.strip
  
  if Artist.all.find{|artist| artist.name == ip}
  songs_of_artist = []
  songs_of_artist = Song.all.select{|song| song.artist.name == ip}
  #binding.pry
  songs_of_artist = songs_of_artist.sort_by {|song| song.name}
  n = 1
    songs_of_artist.each do |song|
      puts "#{n}. #{song.name} - #{song.genre.name}" 
      n = n + 1
    end
  end
  
  end
  
  def list_songs_by_genre
  puts "Please enter the name of a genre:"
  ip = gets.strip
  
  if Genre.all.find{|genre| genre.name == ip}
  songs_of_genre = []
  songs_of_genre = Song.all.select{|song| song.genre.name == ip}
  #binding.pry
  songs_of_genre = songs_of_genre.sort_by {|song| song.name}
  n = 1
    songs_of_genre.each do |song|
      puts "#{n}. #{song.artist.name} - #{song.name}" 
      n = n + 1
    end
    
  end
  end
  
  def play_song
  puts "Which song number would you like to play?"
  
  ip = gets.strip
  ip = ip.to_i
  count = Song.all.count
  
  if ip <= count
  sorted_songs = []
  sorted_songs = Song.all
  sorted_songs = sorted_songs.sort_by {|song| song.name}
  n = 1
  sorted_songs.collect do |song|
    puts "Playing #{song.name} by #{song.artist.name}" if n == ip
    n = n + 1
    end
  end
  
  end
  
end