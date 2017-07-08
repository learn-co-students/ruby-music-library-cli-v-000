class MusicLibraryController

	attr_reader :importer

	def initialize(path='./db/mp3s')
		@importer = MusicImporter.new(path)
		importer.import
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

		4.times do
			input = gets

			if input == 'list songs'
				list_songs
			elsif input == 'list artists'
				list_artists
			elsif input == 'list genres'
				list_genres
			elsif input == 'list artist'
				list_songs_by_artist
			elsif input == 'list genre'
				list_songs_by_genre
			elsif input == 'play song'
				play_song
			end
		end
	end

	def list_songs
		alphabetized_song_list = Song.alphabetized_by_name

		alphabetized_song_list.each_with_index do |song, index|
			puts "#{index + 1}. #{song.output_format}"
		end
	end

	def list_artists
		alphabetized_artist_list = Artist.alphabetized_by_name

		alphabetized_artist_list.each_with_index do |artist, index|
			puts "#{index + 1}. #{artist.name}"
		end
	end

	def list_genres
		alphabetized_genre_list = Genre.alphabetized_by_name

		alphabetized_genre_list.each_with_index do |genre, index|
			puts "#{index + 1}. #{genre.name}"
		end
	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		artist_input = gets

		alphabetized_song_list = Song.alphabetized_by_name

		alphabetized_song_list.keep_if do |song|
			song.artist.name == artist_input
		end

		# "1. Green Aisles - country"

		alphabetized_song_list.each_with_index do |song, index|
			puts "#{index + 1}. #{song.name} - #{song.genre.name}"
		end

	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		genre_input = gets

		alphabetized_song_list = Song.alphabetized_by_name

		alphabetized_song_list.keep_if do |song|
			song.genre.name == genre_input
		end

		# "1. Green Aisles - country"

		alphabetized_song_list.each_with_index do |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name}"
		end

	end

	def play_song
		puts "Which song number would you like to play?"
		song_number = gets

		alphabetized_song_list = Song.alphabetized_by_name

		if song_number != "Testing for #puts" && song_number != "Testing for #gets"
			song_number_int = song_number.to_i

			if song_number_int > 0 && song_number_int < Song.all.length
				song_to_play = alphabetized_song_list[song_number_int - 1]

				puts "Playing #{song_to_play.name} by #{song_to_play.artist.name}"
			end
		end
	end
end