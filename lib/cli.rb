class MusicLibraryController
	def initialize(path = "./db/mp3s")
		importer = MP3Import.new(path)
		importer.import
	end

	def call
		puts "Welcome to your Music Library!\n What would you like to do?"
		action = gets.strip

		case action.downcase
		when "list songs"
			songs
		when "list artists"
			artists
		when "list genres"
			genres
		when "list artist"
			list_artist
		when "list genres"
			list_genre
		when "play song"
			play_song
		end
	end

	def songs
		Song.all.each_with_index {|s, i| puts "#{i+1}. #{s}"}
	end

	def artists
		Artist.all.each_with_index {|a, i| puts "#{i+1}. #{a}"}
	end

	def genres
		Genre.all.each_with_index {|g, i| puts "#{i+1}. #{g}"}
	end

	def list_artist
		"Which artist would you like to list songs for"
		name = gets.strip
		if artist = Artist.find_by_name(name)
			artist.songs.each_with_index {|s, i| puts "#{i+1}. #{s}"}
		else
			puts "That artist is not in the collection"
		end

	end

	def list_genre
		"Which genre would you like to list songs for"
		name = gets.strip
		if genre = Genre.find_by_name(name)
			genre.songs.each_with_index {|s, i| puts "#{i+1}. #{s}"}
		else
			puts "That genre is not in the collection"
		end

	end

	def play_song
		"What song number would you like to play"
		number = gets.strip.to_i
		puts "Playing #{Song.all[number-1]}"
	end

end
