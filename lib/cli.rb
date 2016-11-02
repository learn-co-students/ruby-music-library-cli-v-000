class MusicLibraryController
	def initialize(path = "./db/mp3s")
		importer = MusicImporter.new(path)
		importer.import
	end

	def call
		action = nil

		while action != "exit"
		puts "Welcome to your Music Library!\nWhat would you like to do?"
		action = gets.strip.downcase

			case action
			when "list songs"
				 songs
			when "list artists"
				artists
			when "list genres"
				genres
			when "list artist"
				list_artist
			when "list genre"
				list_genre
			when "play song"
				play_song
			else
				"Not a valid command"
			end
		end
	end

	def songs
		Song.all.each_with_index {|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
	end

	def artists
		Artist.all.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
	end

	def genres
		Genre.all.each_with_index{|g, i| puts "#{i+1}. #{g.name}"}
	end

	def list_artist
		puts "Which artist would you like to list songs for"
		name = gets.strip
		if artist = Artist.find_by_name(name)
			artist.songs.each_with_index {|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
		else
			puts "That artist is not in the collection"
		end

	end

	def list_genre
		puts "Which genre would you like to list songs for"
		name = gets.strip
		if genre = Genre.find_by_name(name)
			genre.songs.each_with_index {|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
		else
			puts "That genre is not in the collection"
		end

	end

	def play_song
		puts "What song number would you like to play"
		number = gets.strip.to_i
		song = Song.all[number - 1]
		puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
	end

end
