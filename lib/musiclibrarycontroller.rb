

class MusicLibraryController
	


	def initialize(path = "./db/mp3s")
		importer = MusicImporter.new(path)
		importer.import
	end

	def call
		input = ""
		until input == "exit"
		 puts "Welcome to your music library!"
		 puts "What would you like to do?" 
		 input = gets.strip
		 case input
		 when "list songs"
		 	list_songs
		 when "list artists"
		 	list_artists
		 when "list genres"
		 	list_genres
		 when "list artist"
		 	list_songs_by_artist
		 when "list genre"
		 	list_songs_by_genre
		 when "play song"
		 	play_song
		 end
		end
		 puts "To list all of your songs, enter 'list songs'."
		 puts "To list all of the artists in your library, enter 'list artists'."
		 puts "To list all of the genres in your library, enter 'list genres'."
		 puts "To list all of the songs by a particular artist, enter 'list artist'."
		 puts "To list all of the songs of a particular genre, enter 'list genre'."
		 puts "To play a song, enter 'play song'."
		 puts "To quit, type 'exit'."
	end

		 
	

	def list_songs
		songs = Song.all.sort {|a,b| a.name <=> b.name}
    	songs.each_with_index do |song, index|
       	puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     	end

  	end
	
	def list_artists
		artists = Artist.all.sort {|a, b| a.name <=> b.name}
    	artists.each_with_index do |artist, index|
       	puts "#{index + 1}. #{artist.name}"
     	end
	end

	def list_genres
		genres = Genre.all.sort {|a,b| a.name <=> b.name}
		genres.each_with_index do |genre, index|
			puts "#{index + 1}. #{genre.name}"
		end

	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		artist_selected = gets.strip
		if artist = Artist.find_by_name(artist_selected)
		artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |song, index|
		puts "#{index + 1}. #{song.name} - #{song.genre.name}"
		end
	end
	end

	# the method above and below this line both get song lists by artist or genre, alphabetized by song, but slightly different coding.

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		if genre = Genre.find_by_name(gets.strip)
		list = genre.songs.sort {|song_a, song_b| song_a.name <=> song_b.name}
		list.each_with_index do |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name}"
		end
	end
	end

	def play_song
		puts "Which song number would you like to play?"
		if gets.strip.to_i.between?(1, Song.all.count)
		song_num = gets.strip.to_i - 1
		song = Song.all.sort {|a,b| a.name <=> b.name}
		puts "Playing #{song[song_num].name} by #{song[song_num].artist.name}" 
		end
	
	end






end
