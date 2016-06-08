require 'pry'

class MusicLibraryController

	attr_accessor :path, :call
	
	def initialize(path="./db/mp3s")
		music_importer = MusicImporter.new(path)
		music_importer.import
	end
		
	def call
		begin
			puts "Type in 'commands' for a list of available commands"
			puts "Otherwise type in 'exit' to escape program"
			input = gets.strip
			
			if input == "commands"
				commands
			elsif input == "list songs"
				list_songs
			elsif input == "list artists"
				list_artists
			elsif input == "list genres"
				list_genres
			elsif input == "play song"
				play_song
			elsif input == "list artist"
				list_artist
			elsif input == "list genre"
				list_genre
			end
		end until input == "exit"
	end
	
	def commands
		puts "list songs"
		puts "list artists"
		puts "list genres"
		puts "play song"
		puts "list artist"
		puts "list genre"
		puts "exit"
	end
	
	def list_songs
		Song.all.each_with_index do |object, i|
			puts "#{i + 1}. #{object.artist.name} - #{object.name} - #{object.genre.name}"
		end
	end
	
	def list_artists
		x = Artist.all.uniq
		x.each do |artist|
			puts "#{artist.name}"
		end
	end
	
	def list_genres
		Genre.all.each do |genre|
			puts "#{genre.name}"
		end
	end
	
	def play_song
		puts "Please pick a song number (between 1-99) you'd like to play."
		
		input = gets.chomp
		
		if input.to_i < 100 && input.to_i > 0
			puts "Playing #{Song.all[input.to_i-1].artist.name} - #{Song.all[input.to_i-1].name} - #{Song.all[input.to_i-1].genre.name}"
		else
			play_song
		end			
	end	
	
	def list_artist
		puts "Please provide an artist's name to see their songs"
		input = gets.strip
		if input  == Artist.find_by_name(input).name
			Artist.find_by_name(input).songs.each do |song|
				puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
			end
		end
	end
	
	def list_genre
		puts "Please provide a genre name to see its songs"
		input = gets.strip
		if input == Genre.find_by_name(input).name
			Genre.find_by_name(input).songs.each do |song|
				puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
			end
		end
	end


end
	
