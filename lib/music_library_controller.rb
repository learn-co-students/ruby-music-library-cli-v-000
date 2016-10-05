require 'pry'
class MusicLibraryController

	attr_accessor :path

	def initialize(path="./db/mp3s")
		@path = path
		libaray = MusicImporter.new(self.path)
    libaray.import
	end

	def call
     user_input = ""
		while user_input != "exit"
			puts "Welcome to your music libaray"
			puts "What would you like to do"
			user_input = gets.chomp
			case user_input 
			 when "list songs"
         songs 		  					  
			 when "list artists"
		     artists
			 when "list genres"
         genres
       when "list artist"
         list_artist
       when "list genre"
         list_genre	   	   	   
			 when "play song"
         play_song     		
			end
		end
	end


  def play_song
    	puts "What song would you like to play"
    	song_input = gets.chomp.to_i
    	song = Song.all[song_input -1]
    	puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

	def songs
	  Song.all.each.with_index(1) do |song, index|
	  	puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
	  end
	end

	def artists
		 Artist.all.each.with_index(1) do |artist, index| 
		   puts "#{index}. #{artist.name}"
		 end
	end

	def genres
		  Genre.all.each.with_index do|genre, index| 
		  	puts "#{index}. #{genre.name}"
		  end
	end

	def list_artist
		  puts "Please choose an artist to desplay his songs"
		  artist_input = gets.chomp
		  if artist = Artist.find_by_name(artist_input)
		     artist.songs.each.with_index(1) do|song, index|
		       puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		     end 
		  end
	end

	def list_genre
	   puts "Please choose a genre to desplay his songs"
	   genre_input = gets.chomp
	   if genre = Genre.find_by_name(genre_input)
	     genre.songs.each.with_index(1) do |song, index|
	       puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
	     end  
	   end
	end

end

