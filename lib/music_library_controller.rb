require_relative "../lib/music_importer.rb"
require "pry"
class MusicLibraryController
	
	attr_accessor :importer, :library, :can_input
	
	def initialize(path='./db/mp3s')
		@importer = MusicImporter.new(path)
		@library = importer.import
		@sorted = false
	end
	
	def call
		sorted?
		self.can_input = true
		while can_input
			puts "Enter a command"
			get_input
		end
	end
	
	def get_input
		input = gets.chomp
		case input
			when "list songs"
				list_songs
			when "list artists"
				list_artists
			when "list genres"
				list_genres
			when "play song"
				play_song
			when "list artist"
				list_artist
			when "list genre"
				list_genre
			when "exit"
				exit
		end	
	end
	
	def exit
		self.can_input = false;
	end
	
	def list_songs
		library.each.with_index() do |song, i|
			puts "#{i + 1}. #{song_to_string(song)}"
		end
	end
	
	def song_to_string(song)
		"#{song.artist.name} - #{song.name} - #{song.genre.name}"
	end
	
	def list_artists
		library.each {|song| puts "#{song.artist.name}"}
	end
	
	def list_genres
		library.each {|song| puts "#{song.genre.name}"}
	end
	
	def play_song
		puts "Enter track number"
		index = gets.chomp.to_i - 1
		puts "Playing #{song_to_string(library[index])}"
	end
	
	def list_artist
		puts "Enter artist name"
		name = gets.chomp
		artist = library.detect {|song| song.artist.name == name}.artist
		artist.songs.each {|song| puts "#{song_to_string(song)}"}
	end
	
	def list_genre
		puts "Enter a genre"
		input = gets.chomp
		genre = Genre.all.detect {|genre| genre.name == input}
		genre.songs.each {|song| puts "#{song_to_string(song)}"}
	end
	
	private 
	attr_accessor :sorted
	
	def sorted?
		if !sorted
			library.sort_by! {|song| song.artist.name}
			self.sorted = true
		end
	end
	
end
