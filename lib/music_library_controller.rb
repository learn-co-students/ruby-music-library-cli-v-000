require 'pry'

class MusicLibraryController
	attr_accessor :songs

	def initialize(path="./db/mp3s")
		@songs = MusicImporter.new(path).import
	end

	def call
		input = ""
		until input == "exit"
			input = gets.strip.downcase

			case input
			when "list genres" 
				@songs.each {|song| puts song.genre.name}
			when "list songs"
				@songs.each_with_index {|song, index| 
					puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
				}
			when "list artists" 
				@songs.each_with_index {|song, index| puts song.artist.name}
			when "list artist"
				puts "Which artist?"
				artist_name = gets.strip
				artist = Artist.find_by_name(artist_name)
				
				artist.songs.each {|song|
					puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == artist_name
				}
			when "list genre"
				puts "Which genre?"
				genre_name = gets.strip
				genre = Genre.find_by_name(genre_name)

				genre.songs.each {|song|
					puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == genre_name
				}
			when "play song"
				puts "Which song would you like to play?"
				input = gets.strip.downcase
				song = @songs[input.to_i-1]
				puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
			when "exit"
			else
				puts "invalid response. try again."
				call
			end
		end
	end
end
