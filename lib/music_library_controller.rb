
require 'pry'
class MusicLibraryController
	attr_accessor :path, :files

	def initialize(path = "./db/mp3s")
		@path =	path
		music_importer = MusicImporter.new(path)
		music_importer.import
	end

	def call
		user_input = " "
		while user_input != "exit"
			puts "Welcome to your Music Library"
			puts "Please enter: list songs, list artists, list genres, play song, list artist, list genre, exit"
			user_input = gets.strip.downcase
				case user_input
					when "list songs"
						list_songs
					when "list artists"
						puts Artist.all
					when "list genres"
						puts Genre.all
					when "play song"
				 		play_song
					when "list artist"
						puts "Please enter an artist:"
						artist_input = gets.strip
						Song.all.select {|song| song.artist.name == artist_input}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}
						#list_songs_by_artist(artist_input)			
					when "list genre"
						puts "Please enter a genre:"
						genre_input = gets.strip
						Song.all.select {|song| song.genre.name == genre_input}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}
						#list_songs_by_genre(genre_input)			 	
				end
		end
	end

	def list_songs
		Song.all.each_with_index {|song, i| puts "#{i + 1}. #{song.artist} - #{song.name} - #{song.genre}"}
	end

	def play_song
		puts "Please enter a song number"
		song_number = gets.to_i - 1
		puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
	end

	#def list_songs_by_artist(artist_input)
	#	Song.all.select {|s| s.artist == artist_input}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}
	#end

	#def list_songs_by_genre(genre_input)
	#	Song.all.select {|s| s.genre == genre_input}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}
	#end
		

	
end
