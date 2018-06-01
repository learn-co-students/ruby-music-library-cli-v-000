


class MusicLibraryController

	def initialize(path="./db/mp3s")
		MusicImporter.new(path).import
	end


	def call

		input = ""
		while input != "exit"

			puts "Welcome to your music library!"
			puts "To list all of your songs, enter 'list songs'."
			puts "To list all of the artists in your library, enter 'list artists'."
			puts "To list all of the genres in your library, enter 'list genres'."
			puts "To list all of the songs by a particular artist, enter 'list artist'."
			puts "To list all of the songs of a particular genre, enter 'list genre'."
			puts "To play a song, enter 'play song'."
			puts "To quit, type 'exit'."
			puts "What would you like to do?"
			input = gets.strip
			
  		case input
  	  when input == "list songs"
  	    list_songs
  	  when input == 'list artists'
  	    list_artists
  	   when input == 'list genres'
  	     list_genres
  	   when input == 'list artist'
  	     list_songs_by_artist
  	   when input == 'list genre'
  	     list_songs_by_genre
  	   when input == 'play song'
  	     play_song
  	   else
  	     call
  	end
  end
end
	
	



	def list_songs
		Song.all.sort_by(&:name).each.with_index(1) do |song,ix|
			puts "#{ix}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_artists
		Artist.all.sort_by(&:name).each.with_index(1) do |artist,ix|
			puts "#{ix}. #{artist.name}"
		end
	end

	def list_genres
		Genre.all.sort_by(&:name).each.with_index(1) do |genre,ix|
			puts "#{ix}. #{genre.name}"
		end
	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		get_artist = gets.strip
		if artist = Artist.find_by_name(get_artist)
			artist.all.sort_by(&:name).each.with_index(1) do |artist,ix|
				puts "#{ix}. #{song.name} - #{song.genre.name}"
			end
		end
	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		get_genre = gets.strip
		if genre = Genre.find_by_name(get_genre)
			genre.all.sort_by(&:name).each.with_index(1) do |genre,ix|
				puts "#{ix}. #{song.artist.name} - #{song.name}"
			end
		end
	end


	def play_song
		"Which song number would you like to play?"
		song_num = gets.strip.to_i
		if (1..Song.all.length).include?(song_num)
			song = Song.all(song_num)
			puts "Playing #{song.name} by #{song.artist}" if song
		end
	end

end




