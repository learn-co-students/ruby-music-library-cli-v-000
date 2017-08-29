class MusicLibraryController
	extend Concerns::Findable
	@choice = ""
	def initialize(path='./db/mp3s')

		@path = path
		mi = MusicImporter.new(path)

		mi.import

	end

	def call
		
		puts "Welcome to your music library!"
		until @choice == "exit"
			puts "To list all of your songs, enter 'list songs'."
			puts "To list all of the artists in your library, enter 'list artists'."
	      	puts "To list all of the genres in your library, enter 'list genres'."
	      	puts "To list all of the songs by a particular artist, enter 'list artist'."
	      	puts "To list all of the songs of a particular genre, enter 'list genre'."
	      	puts "To play a song, enter 'play song'."
	      	puts "To quit, type 'exit'."
			puts "What would you like to do?"
		@choice = gets.chomp

			case @choice
				when "play song"
					self.play_song
				when "list songs"
					self.list_songs
				when "list artists"
					self.list_artists
				when "list genres"
					self.list_genres
				when "list artist"
					self.list_songs_by_artist
				when "list genre"	
					self.list_songs_by_genre	
			end
		#binding.pry
		end
		#loop until user inputs 'exit'
	end

	def list_songs
		Song.all.sort_by { |x| x.name}
		arr = Song.all.sort_by { |x| x.name}

		arr = arr.uniq 
		arr.each do |n|
			index = arr.index(n)+1
			 puts "#{index}. #{n.artist.name} - #{n.name} - #{n.genre.name}"
			end
	end

	def list_artists
		#binding.pry
		arr = Artist.all.sort_by { |x| x.name} 
		arr.each do |n|
			index = arr.index(n)+1
			 puts "#{index}. #{n.name}"
			end
	end

	def list_genres

		arr = Genre.all.sort_by { |x| x.name} 
		arr.each do |n|
			index = arr.index(n)+1
			 puts "#{index}. #{n.name}"
		end
	end

	def list_songs_by_artist
		choice = ""
		puts "Please enter the name of an artist:"
		choice = gets.chomp
		

		artist = Artist.find_by_name(choice)
		#binding.pry
			if artist != nil
				arr = artist.songs.sort_by{|x| x.name}
				arr.each do |n|
					index = arr.index(n)+1
			 		puts "#{index}. #{n.name} - #{n.genre.name}"
				end
			end
	end		

	def list_songs_by_genre
		choice = ""
		puts "Please enter the name of a genre:"
		choice = gets.chomp
		

		genre = Genre.find_by_name(choice)
		#binding.pry
			if genre != nil
				arr = genre.songs.sort_by{|x| x.name}
				arr.each do |n|
					index = arr.index(n)+1
			 		puts "#{index}. #{n.artist.name} - #{n.name}"
				end
			end		
	end

	

	def play_song
		choice = ""
		arr = Song.all.sort_by { |x| x.name}
		puts "Which song number would you like to play?"
		choice = gets.to_i - 1
		
		if choice >= 1 && choice <= arr.length - 1
			puts "Playing #{arr[choice].name} by #{arr[choice].artist.name}"
		end
		choice
	end
end
