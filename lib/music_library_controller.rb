class MusicLibraryController 

	def initialize(path = "./db/mp3s")  
		MusicImporter.new(path).import   
	end 

	def call 
		puts "Welcome to your music library!" 
		input = ""
		until input == "exit" 
			puts "To list all of your songs, enter 'list songs'." 
			puts "To list all of the artists in your library, enter 'list artists'." 
			puts "To list all of the genres in your library, enter 'list genres'." 
			puts "To list all of the songs by a particular artist, enter 'list artist'." 
			puts "To list all of the songs of a particular genre, enter 'list genre'." 
			puts "To play a song, enter 'play song'." 
			puts "To quit, type 'exit'." 
			puts "What would you like to do?"  
			input = gets.chomp.downcase 

			case input 
			when "list songs" 
				list_songs 
			when "list artists" 
				list_artists 
			when "list genres" 
				list_genres 
			when "list artist" 
				list_songs_by_artist 
			when "list genre" 
				list_songs_by_genre 
			when "play song" 
				play_song 
			end
		end 
	end 

	def list_songs 
		Song.all.sort_by { |song| song.name }.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"} 
	end 

	def list_artists 
		Artist.all.sort_by { |artist| artist.name }.each.with_index(1) { |artist, index| puts "#{index}. #{artist.name}" }
	end 

	def list_genres 
		Genre.all.sort_by { |genre| genre.name }.each.with_index(1) { |genre, index| puts "#{index}. #{genre.name}" }
	end 

	def list_songs_by_artist 
		puts "Please enter the name of an artist:" 
		input = gets.chomp 
		if artist = Artist.find_by_name(input) 
			artist.songs.sort_by { |song| song.name }.each.with_index(1) { |song, index| puts "#{index}. #{song.name} - #{song.genre.name}"} 
		end
	end 

	def list_songs_by_genre 
		puts "Please enter the name of a genre:" 
		input = gets.chomp 
		if genre = Genre.find_by_name(input) 
			genre.songs.sort_by { |song| song.name }.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name}"} 
		end
	end  

	def play_song 
		puts "Which song number would you like to play?" 
		input = gets.chomp 
		index = input.to_i - 1 
		song_list = Song.all.sort_by { |song| song.name }
		if 0 < input.to_i && input.to_i < song_list.length   
			puts  "Playing #{song_list[index].name} by #{song_list[index].artist.name}" if song_list[index] != nil 
		end
	end

end 
