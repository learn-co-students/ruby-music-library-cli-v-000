class MusicLibraryController

	def initialize(path = "./db/mp3s")
		importer = MusicImporter.new(path)
		importer.import
	end

	def call
		user_input = " "
		while user_input != "exit"
		puts "What would you like to do? When done type 'exit'."
		user_input = gets.chomp
		case user_input
		when "list songs"
			Song.all.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
		when "list artists"
			Song.all.each {|song| puts "#{song.artist.name}"}
		when "list genres"
			Song.all.each {|song| puts "#{song.genre.name}"}
		when "play song"
			Song.all.each {|song| puts "Now Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
		when "list artist"
			Song.all.each {|song| puts "-#{song.artist.name} - #{song.name} - #{song.genre.name}"}
		when "list genre"
			Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
		end
	end
	end
end
