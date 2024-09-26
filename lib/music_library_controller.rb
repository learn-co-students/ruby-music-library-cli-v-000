class MusicLibraryController
	attr_accessor :path

	def initialize(path = './db/mp3s')
		@path = path
		MusicImporter.new(path).import
	end




def call

	answer = "exit"
	input = ""

	until input == answer
		puts "Welcome to Music World!!"
		puts "Please choose from the following:"
			puts "1. list songs"
			puts "2. list artists"
			puts "3. list genres"
			puts "4. play song"
			puts "5. list an artist's songs"
			puts "6. list a genre's songs"
		input = gets.chomp

		case input
		when "list songs"
			Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
		when "list artists"
			Artist.all.each {|artist| puts "#{artist.name}"}
		when "list genres"
			Genre.all.each {|genre| puts "#{genre.name}"}
		when "play song"
			puts "What song?"
			input  = gets.chomp.to_i - 1
			song = Song.all[input]
			puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
		when "list artist"
			puts "what artist?"
			artist = gets.chomp
			Artist.find_by_name(artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
		when "list genre"
			puts "what genre?"
			genre = gets.chomp
			Genre.find_by_name(genre).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

			
			
			


		end


	end

end

	


end


























