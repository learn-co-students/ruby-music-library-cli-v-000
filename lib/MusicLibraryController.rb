class MusicLibraryController
 attr_accessor :path
 
 def initialize(path = './db/mp3s')
   MusicImporter.new(path).import
 end
 
 def call
   input = ""
   while input != "exit"
 
     puts "Welcome to your Music Library!"
     puts "Please choose an option: list songs, list artists, list genres, play song, list artist, list genre, or exit."
     input = gets.chomp.strip.downcase
 
     case input
     when "list songs"
       songs
     when "list artists"
       artists
     when "list genres" 
       genres
     when "play song"
       play_song
     when "list artist"
       list_artist
     when "list genre"
       list_genre
     when "exit"
       break
 
       puts "Thank you for using the Music Library!"
 
     end
   end
 end
 def songs
      Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.information}"}
 end
 
 def artists
      Artist.all.each {|artist| puts artist.name}
 end
 
 def genres
      Genre.all.each {|genre| puts genre.name}
 end
 
 def play_song
   puts "Which song number would you like to play?"
   song_input = gets.chomp.to_i
   song = Song.all[song_input - 1]
   puts "Playing #{song.information}"
 end
 
 def list_artist
   puts "Which artist's songs would you like to view?"
   artist_wanted = gets.chomp
 if artist_wanted != nil
   Artist.find_by_name(artist_wanted).songs.each {|song| puts song.information}
 else
   "This artist is currently not in our database."
 end
 end
 
 def list_genre
   puts "Which genre's songs would you like to view?"
   genre_wanted = gets.chomp
 if genre_wanted != nil
   Genre.find_by_name(genre_wanted).songs.each {|song| puts song.information}
 else
   "This genre is currently not in our database."
 end
 end
 
 def details
     "#{self.artist.name} - #{self.name} - #{self.genre.name}"
   end
 
 end