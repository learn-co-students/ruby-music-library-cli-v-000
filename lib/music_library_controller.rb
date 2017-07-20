class MusicLibraryController
	
	attr_accessor :path
	
	def initialize(path='./db/mp3s')
		@path = path
		path_obj = MusicImporter.new(path)
# binding.pry
		path_obj.import
	end
	
	def call
	  user_input = gets.strip
    until user_input == 'exit'
    	puts "Welcome to your music library!" 
	    puts "To list all of your songs, enter 'list songs'."    	    
	    puts "To list all of the artists in your library, enter 'list artists'."
	    puts "To list all of the genres in your library, enter 'list genres'."
	    puts "To list all of the songs by a particular artist, enter 'list artist'."
	    puts "To list all of the songs of a particular genre, enter 'list genre'."
	    puts "To play a song, enter 'play song'."
	    puts "To quit, type 'exit'."
	    puts "What would you like to do?"
    	
    	if user_input == 'list songs'
    		self.list_songs
    	elsif user_input == 'list artists'
    		self.list_artists
    	elsif user_input == 'list genres'
    		self.list_genres
    	elsif user_input == 'list artist'
    		self.list_songs_by_artist
    	elsif user_input == 'list genre'    	    	
    		self.list_songs_by_genre
    	else user_input == 'play song'
    		self.play_song
    	end 	 
	  end
	end
	
	def list_songs
		Song.all.sort_by { |song| song.name }.each_with_index do |song, i| 
			puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end
	
	def list_artists
		Artist.all.sort_by { |artist| artist.name }.each_with_index { |artist, i| puts "#{i+1}. #{artist.name}" }
	end

	def list_genres
		Genre.all.sort_by { |genre| genre.name }.each_with_index { |genre, i| puts "#{i+1}. #{genre.name}" }
	end	
	
	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		user_input = gets.strip
      if artist = Artist.find_by_name(user_input)
        artist.songs.sort_by { |song| song.name }.each.with_index do |song, i|
          puts "#{i+1}. #{song.name} - #{song.genre.name}"
        end
      else
      	puts "Please enter the name of an artist:" until user_input != nil
      end		
	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		user_input = gets.strip
      if genre = Genre.find_by_name(user_input)
        genre.songs.sort_by { |song| song.name }.each.with_index do |song, i|
          puts "#{i+1}. #{song.artist.name} - #{song.name}"
        end
      else
      	puts "Please enter the name of a genre:" until user_input != nil
      end		
	end

	def play_song
		puts "Which song number would you like to play?"
		user_input = gets.strip.to_i
		Song.all.sort_by { |song| song.name }.each_with_index do |song, i|
			if i + 1 == user_input 
				puts "Playing #{song.name} by #{song.artist.name}" 
			else
				nil
			end
		end
	end
end