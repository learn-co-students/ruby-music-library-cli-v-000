class MusicLibraryController
	attr_accessor :path
	
	def initialize(path="./db/mp3s")
		@path = path
		musiclibrary = MusicImporter.new(@path).import
		musiclibrary
	end

	def call
		puts "Hello, what would you like to do?"
		puts "list songs"
		puts "list artists"
		puts "list genres"
		puts "play song"
		puts "list artist"
		puts "list genre"
		puts "exit"

		user_input = gets.chomp
		if user_input != "exit"
			cli(user_input)
			call
		else
			puts "Good Bye"
		end
	end

	def cli(user_input)
		case user_input

		when nil
			call	
		when "list songs"
			Song.all.each_with_index do |s, i| 
				puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
			end
		when "list artists"
			Artist.all.each do |a|
				puts "#{a.name}"
			end
		when "list genres"
			Genre.all.each do |g|
				puts "#{g.name}"
			end
		when "play song"
			Song.all.each do |s|
				puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
			end
		when "list artist"
			Artist.all.each do |a|
				a.songs.each do |s|
					puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
				end	
			end
		when "list genre"	
			Genre.all.each do |genre|
				genre.songs.each do |s|
					puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
				end
			end
		end
	end
end