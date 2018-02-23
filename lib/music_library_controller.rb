class MusicLibraryController
	attr_accessor :path

	def initialize(path = './db/mp3s')
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


      input = gets.chomp

      if input == 'list songs'
      	self.list_songs
      elsif input == 'list artists'
      	list_artists
      elsif input == 'list genres'
      	list_genres
      elsif input == 'list artist'
      	list_songs_by_artist
      elsif input == 'list genre'
      	list_songs_by_genre
      elsif input == 'play song'
      	play_song
      elsif input == 'exit'
      	return "Goodbye!"
      else
      	self.call
      end

    end


    def list_songs
    	Song.all.sort{|song_x, song_y| song_x.name <=> song_y.name}.each_with_index do |song, i|
    		puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    	end
    end

    def list_artists
    	Artist.all.sort{|artist_x, artist_y| artist_x.name <=> artist_y.name}.each_with_index do |artist, i|
    		puts "#{i + 1}. #{artist.name}"
    	end
    end

     def list_genres
    	Genre.all.sort{|genre_x, genre_y| genre_x.name <=> genre_y.name}.each_with_index do |genre, i|
    		puts "#{i + 1}. #{genre.name}"
    	end
    end

    def list_songs_by_artist
    	puts "Please enter the name of an artist:"

    	artist_name = gets.chomp
    	if Artist.find_by_name(artist_name)
    		Artist.find_by_name(artist_name).songs.sort{|song_x, song_y| song_x.name <=> song_y.name}.each_with_index do |song, i|
    			puts "#{i + 1}. #{song.name} - #{song.genre.name}"
    		end
    	else
    	end
	end

	def list_songs_by_genre
    	puts "Please enter the name of a genre:"

    	genre_name = gets.chomp
    	if Genre.find_by_name(genre_name)
    		Genre.find_by_name(genre_name).songs.sort{|song_x, song_y| song_x.name <=> song_y.name}.each_with_index do |song, i|
    			puts "#{i + 1}. #{song.artist.name} - #{song.name}"
    		end
    	else
    	end
	end

	def play_song
		puts "Which song number would you like to play?"

		song_num = gets.chomp.to_i

		if song_num > 0 && song_num <= Song.all.length
			song = Song.all.sort{|song_x, song_y| song_x.name <=> song_y.name}[song_num - 1]
			puts "Playing #{song.name} by #{song.artist.name}"
		else
		end
	end
end 
