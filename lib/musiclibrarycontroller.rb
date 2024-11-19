require 'pry'

class MusicLibraryController
  
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
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
 input = ""
 while input != "exit"
 input = gets.strip
 if input == "list songs"
     self.list_songs
     elsif input == "list artists"
     self.list_artists
     elsif input == "list genres"
     self.list_genres
     elsif input == "list artist"
     self.list_songs_by_artist
     elsif input == "list genre"
     self.list_songs_by_genre
     elsif input == "play song"
     self.play_song
    end
 end
 
end

def list_songs
  songs = Song.all.sort_by!{|s| s.name}
  songs.each.with_index do |s,i|
    puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end
end

  def list_artists
  Artist.all.sort_by!{|s| s.name}.each.with_index(1) do |s,i|
    puts "#{i}. #{s.name}"
  end
  end
  
  def list_genres
    Genre.all.sort_by!{|s| s.name}.each.with_index(1) do |s,i|
      puts "#{i}. #{s.name}"
    end
  end
  
def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets
  artist = Artist.find_by_name(input)
  #binding.pry
  if artist != nil
  artist.songs.sort_by!{|s| s.name}.each.with_index(1) do |s, i|
    puts "#{i}. #{s.name} - #{s.genre.name}"
  end
end
end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
  input = gets
  genre = Genre.find_by_name(input)
  #binding.pry
  if genre != nil
  genre.songs.sort_by!{|s| s.name}.each.with_index(1) do |s, i|
    puts "#{i}. #{s.artist.name} - #{s.name}"
  end
end
end

  def play_song
    songs = Song.all.sort_by!{|s| s.name}
    range = (1..songs.length).to_a
    puts "Which song number would you like to play?"
    input = gets
    if range.include? (input.to_i) 
    puts "Playing #{songs[input.to_i-1].name} by #{songs[input.to_i-1].artist.name}"
  
  end
  end
  
end


