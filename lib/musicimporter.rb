class MusicImporter
	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		files = Dir.glob("#{@path}/*.mp3")
		files.collect do |file|
			file.gsub("#{@path}/", "")
		end
	end

	def import
		files.each do |file|
			Song.create_from_filename(file)
		end
	end
end

class MusicLibraryController

	attr_accessor :path

	def initialize(path = "./db/mp3s")
		@path = path
		MusicImporter.new(path).import
	end

	def call
		input = ""
		while input != "exit"
			puts "enter command"
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
			end
		end
	end

	def list_songs
		Song.all.each_with_index do |song, i|
			puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_artists
		Song.all.each do |song|
			puts "#{song.artist.name}"
		end
	end

	def list_genres
		Song.all.each do |song|
			puts "#{song.genre.name}"
		end
	end

	def play_song
		puts "Song number?"
		number = gets.chomp.to_i
		Song.all.each_with_index do |song, i|
			puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" if number == i + 1
		end
	end

	def list_artist
		puts "artist?"
		artist = gets.chomp
		Song.all.each do |song|
			puts  "#{song.artist.name} - #{song.name} - #{song.genre.name}" if artist == song.artist.name
		end
	end

	def list_genre
		puts "Genre?"
		genre = gets.chomp
		Song.all.each do |song|
			puts  "#{song.artist.name} - #{song.name} - #{song.genre.name}" if genre == song.genre.name
		end
	end
end