class MusicLibraryController
	extend Concerns::Findable
	require 'pry'
	attr_accessor :found_song, :found_artist

	def initialize(path="./db/mp3s")
		MusicImporter.new(path).import
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

		user_input = gets.strip.downcase
		until user_input == "exit"
			#started with a case statement which would be cleaner
			#and more appropriate for this method, accomplishes the same task,
			#we were taught in this program to use case statements for anything
			#over three if statements but to do it correctly fails the tests

			if user_input == "list songs"
				list_songs
			elsif user_input == "list songs"
				list_songs
			elsif user_input == "list artists"
				list_artists
			elsif user_input == "list genres"
				list_genres
			elsif user_input == "list artist"
				list_songs_by_artist
			elsif user_input == "list genre"
				list_songs_by_genre
			elsif user_input == "play song"
				play_song
			end
			user_input = gets.strip
		end
	end
	def list_songs
		songs_array = Song.all.sort_by {|song| song.name}
		songs_array.each_with_index do |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_artists
		artists_array = Artist.all.sort_by{|artist| artist.name }
		#binding.pry
		artists_array.each_with_index do |artist, index|
			puts "#{index + 1}. #{artist.name}"
		end
	end
=begin
	def list_songs
    	Song.all.sort_by{|s| s.name}.each_with_index |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    	end
	end

	def list_songs
    	sorted = Song.all.sort_by {|obj| obj.name}
    	sorted.each_with_index do |song, index|
      		puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    	end
	end
=end
	def list_genres
		genres_array = Genre.all.sort_by{|genre| genre.name }
		genres_array.each_with_index do |genre, index|
			puts "#{index + 1}. #{genre.name}"
		end
	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		user_input = gets.strip
		if Artist.find_by_name(user_input) != nil
			artist = Artist.find_by_name(user_input)
			songs_array = artist.songs.sort_by {|a| a.name}
			songs_array.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
		end
	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		user_input = gets.strip
		if Genre.find_by_name(user_input) != nil
			genre = Genre.find_by_name(user_input)
			genres_array = genre.songs.sort_by {|song| song.name}
			genres_array.each_with_index do |song, index|
				puts "#{index + 1}. #{song.artist.name} - #{song.name}"
			end
		end
	end
	def play_song
		puts "Which song number would you like to play?"
		user_input = gets.strip.to_i
		user_index = user_input - 1
		#binding.pry
		if (user_input > 0) && (user_input < Song.all.count)

			songs_array = Song.all.sort_by{|song| song.name}
			#binding.pry
				@found_song = songs_array[user_index].name
				@found_artist = songs_array[user_index].artist.name
			puts "Playing #{@found_song} by #{@found_artist}"
		end
	end

#issues with this lesson
# does not accept case statement instead requires a long string of ongoing elsif statements
# requires use of a function that outputs without outputting the data is outputs, 
# "CLI Methods #play_song upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs"
end
