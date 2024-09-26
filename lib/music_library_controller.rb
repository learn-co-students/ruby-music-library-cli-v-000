require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
  MusicImporter.new(path).import
  end
    
  def list_songs
    Song.all.each_with_index do |song, index|
    puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Song.all.each do |song|
    puts " #{song.artist.name} "
    end
  end
 
 def list_genres
  Song.all.each do |song|
    puts "#{song.genre.name}"
    end
  end

 def play_a_song
  Song.all.each do |song|
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

 def artist_songs
   Song.all.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def genre_songs
    Song.all.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def call
  input = ""
  while input != "exit"
    puts "search"
  input = gets.chomp
  if input == "list songs"
    list_songs
  elsif input == "list artists"
    list_artists
  elsif input == "list genres"
    list_genres
  elsif input == "play song"
    play_a_song
  elsif input == "list artist"
    artist_songs
  elsif input == "list genre"
    genre_songs
 end
 end
  end
end