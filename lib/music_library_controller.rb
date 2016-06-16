class MusicLibraryController

	attr_accessor :path

	def initialize(path = "./db/mp3s")
		@path = path
		MusicImporter.new(@path).import
	end

	def call
		
		"Please enter one of the following commands: list songs, list artists, list genres, play song, list artist (to list an artist's songs), or list genre (to list a genre's songs). Type 'exit' to exit."
		
		input = ""
		
		until input == "exit" 
			
			input = gets.strip

			case

			when input == "list songs"
				Song.all.each_with_index {|song, index|
					puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
				}
			when input == "list artists"
				Artist.all.each {|artist| puts artist.name }
			when input == "list genres"
				Genre.all.each {|genre| puts genre.name }
			when input == "play song"
				puts "What is the song number?"
				song_number = gets.strip.to_i
				song = Song.all[song_number - 1]
				puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
			when input == "list artist"
				puts "What is the artist's name?"
				artist = gets.strip
				Artist.find_by_name(artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
			when input == "list genre"
				puts "What is the genre?"
				genre = gets.strip
				Genre.find_by_name(genre).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
			end
		end
	end
end
