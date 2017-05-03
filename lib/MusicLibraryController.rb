class MusicLibraryController

	def initialize(path = './db/mp3s')
		music = MusicImporter.new(path)
		music.import
	end

	def call
		puts 'Welcome to the Music Library!'
		puts 'Enter "help" to see the list of commands'

		loop do
			puts 'What would you like to do? '
			input = gets.chomp

			case input
			when 'list songs'
				Song.print_songs
			when 'list artists'
				Artist.print_artists
			when 'list genres'
				Genre.print_genres
			when 'list artist'
				puts 'Enter artist name: '
				artist = gets.chomp
				Song.print_songs_by_artist(artist)
			when 'list genre'
				puts 'Enter genre name: '
				genre = gets.chomp
				Song.print_songs_by_genre(genre)
			when 'play song'
				puts 'Enter song number: '
				number = gets.chomp.to_i
				Song.play(number)
			when 'help'
				puts '["list songs", "list artists", "list genres", "list artist", "list genre", play song]'
			end

			break if input == 'exit'
		end
	end

end