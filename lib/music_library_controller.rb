class MusicLibraryController
	attr_accessor :path 

	def initialize(path="./db/mp3s")
		MusicImporter.new(path).import
	end

	def call
		puts "Hello, what would you like to do?"
		input = ""
		until input == "exit"
			#this case statement will work if you build the methods listed
			input = gets.strip
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
				artist_songs
			when "list genre"
				genre_songs
			end
		end
	end

	def songs
		#works!
		Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
	end

	def artists
		#works!
		Artist.all.each {|artist| puts "#{artist.name}"}
	end

	def genres
		#works!
		Genre.all.each {|genre| puts "#{genre.name}"}
	end

	def play_song
		#works!
		#"Playing Action Bronson - Larry Csonka - indie"
		puts "What song number would you like?"
		input = gets.strip.to_i
		song = Song.all[input -1]
		puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
	end

	def artist_songs
		#works!
		#"Real Estate - Green Aisles - country"
		puts "What artist would you like to see?"
		input = gets.strip
		artist = Artist.find_by_name(input)
		songs = artist.songs
		songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

	end

	def genre_songs
		puts "What genre would you like to see?"
		input = gets.strip
		genre = Genre.find_by_name(input)
		songs = genre.songs
		songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
	end



end