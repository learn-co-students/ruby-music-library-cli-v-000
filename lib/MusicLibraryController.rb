class MusicLibraryController
  
  attr_accessor :path, :song, :artist, :genre, :musicimporter

  
  def initialize(path = './db/mp3s')
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
user_input = gets.chomp
case user_input
when "list artists"
  self.list_artists
when "list genres"
  self.list_genres
when "list artist"
  self.list_songs_by_artist 
when "list genre"
  self.list_songs_by_genre
when "play song"
  self.play_song 
  when "list songs"
    self.list_songs
when "exit"
   'exit' 
else call 
end 
end 
 

   
def list_songs 
song_list = Song.all.sort { |song1,song2| song1.name <=> song2.name } 
song_list.each_with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
end



def list_artists 
artist_list = Artist.all.sort { |artist1,artist2| artist1.name <=> artist2.name } 
artist_list.each_with_index {|artist,index| puts "#{index+1}. #{artist.name}"}
end 


def list_genres 
  genre_list = Genre.all.sort { |genre1,genre2| genre1.name <=> genre2.name }
  genre_list.each_with_index { |genre,index| puts "#{index+1}. #{genre.name}" }
end 
  


def list_songs_by_artist
  puts "Please enter the name of an artist:"
  user_input = gets.chomp
if matching_artist = Artist.all.find { |artist|  artist.name == user_input  }
 matching_artist.songs.sort { |song1,song2| song1.name <=> song2.name }.each_with_index { |song,index|
 puts "#{index+1}. #{song.name} - #{song.genre.name}" }
 end 
 end 
 
def list_songs_by_genre
  puts "Please enter the name of a genre:"
  user_input = gets.chomp
  if entire_genre = Genre.all.find {|genre| genre.name == user_input} 
  entire_genre.songs.sort { |song1,song2| song1.name <=> song2.name }.each_with_index{ |song,index| 
  puts "#{index+1}. #{song.artist.name} - #{song.name}"}
end 




def play_song
puts "Which song number would you like to play?"
user_input = gets.chomp
song_list_genre = Song.all

if (1..Song.all.length).include?(user_input.to_i)
song = song_list_genre.sort {|s1,s2| s1.name <=> s2.name}[user_input.to_i - 1] 
end
if song
puts "Playing #{song.name} by #{song.artist.name}"
end 
end
 

 
# def play_song
# puts "Which song number would you like to play?"
# user_input = gets.chomp
# song_list_genre = Song.all[user_input.to_i - 1] 
#   # binding.pry
# song_list_genre.sort {|s1,s2| s1.name <=> s2.name}.each_with_index{ |song,index| 
#   puts "#{index+1}. #{song.artist.name} - #{song.name}"}

# end

# puts "#{user_input}. #{song_list_genre.artist.name} - #{song_list_genre.name}"
# puts "#{user_input}. #{song_list_genre.artist.name} - #{song_list_genre.name}"

end
end 










