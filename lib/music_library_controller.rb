class MusicLibraryController
	attr_accessor :importer
	
	
	def initialize(path='./db/mp3s')
		@importer = MusicImporter.new(path)
		@importer.import
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
		input = gets
		while input != "exit"
			
			case input
			when "list songs"
				list_songs
				puts "What would you like to do?"
				input = gets
			when "list artists"
				list_artists
				puts "What would you like to do?"
				input = gets
			when "list genres"
				list_genres
				puts "What would you like to do?"
				input = gets
			when "list artist"
				list_songs_by_artist
				puts "What would you like to do?"
				input = gets
			when "list genre"
				list_songs_by_genre
				puts "What would you like to do?"
				input = gets
			when "play song"
				play_song
				puts "What would you like to do?"
				input = gets
			else
				puts "What would you like to do?"
				input = gets
			end

		end

	end

	def list_songs
		list = Song.all.sort_by {|song| song.name}
		list.each_with_index do |song, index|
			puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_artists
		list = Artist.all.sort_by {|artist| artist.name}
		list.each_with_index do |artist, index|
			puts "#{index+1}. #{artist.name}"
		end	
		list
	end

	def list_genres
		list = Genre.all.sort_by {|genre| genre.name}
		list.each_with_index do |genre, index|
			puts "#{index+1}. #{genre.name}"
		end	
	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		input = gets
		artist = Artist.find_by_name(input)
		if artist
			songs = artist.songs.sort_by{|s| s.name}
			songs.each_with_index do |song, index|
				puts "#{index+1}. #{song.name} - #{song.genre.name}"
			end
		end
	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		input = gets
		genre = Genre.find_by_name(input)
		if genre
			songs = genre.songs.sort_by{|s| s.name}
			songs = songs.uniq
			songs.each_with_index do |song, index|
				puts "#{index+1}. #{song.artist.name} - #{song.name}"
			end
		end
	end

	def play_song
		puts "Which song number would you like to play?"

		list = Song.all.sort_by {|song| song.name}

		input = gets

		input = input.to_i
		# binding.pry
		if input > 0 && input < list.size
			# binding.pry
			song = list[input-1]
			puts "Playing #{song.name} by #{song.artist.name}"
		end

	end

end