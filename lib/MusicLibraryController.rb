class MusicLibraryController
  
   extend Concerns::Findable

  
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end 
  


  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts  "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    4.times do
      stef = gets 
    end 
  end

  def list_songs
    Song.all.sort {|x,y| x.name <=> y.name }.each.with_index(1) do |item, index|
    puts "#{index}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
  end 
  end 

def list_artists
    Artist.all.sort {|x,y| x.name <=> y.name }.each.with_index(1) do |item, index|
    puts "#{index}. #{item.name}"
  end 
  end 

def list_genres
    Genre.all.sort {|x,y| x.name <=> y.name }.each.with_index(1) do |item, index|
    puts "#{index}. #{item.name}"
  end 
  end
  
def list_songs_by_artist
  puts "Please enter the name of an artist:"
  user_artist = gets 

  if Artist.find_by_name(user_artist) != nil  
   Artist.find_by_name(user_artist).songs.sort {|x,y| x.name <=> y.name }.each.with_index(1) do |item, index|
    puts "#{index}. #{item.name} - #{item.genre.name}"
  end 
  else 
    nil 
  end 
   
end 
 
 
 def list_songs_by_genre
  puts "Please enter the name of a genre:"
  user_genre = gets 

  if Genre.find_by_name(user_genre) != nil  
   Genre.find_by_name(user_genre).songs.sort {|x,y| x.name <=> y.name }.each.with_index(1) do |item, index|
    puts "#{index}. #{item.artist.name} - #{item.name}"
  end 
  else 
    nil 
  end 
   
end 


end #ends class 