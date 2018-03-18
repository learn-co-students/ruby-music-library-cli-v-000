class MusicLibraryController
	
	def initialize(path = "./db/mp3s")
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
			
			user_input = gets.chomp
			
			case user_input
			when 'list songs'
				puts 'ok.....list songs'
				list_songs

			when 'list artists'
				puts 'ok.....list artists'
				list_artists

			when 'list genres'
			puts 'ok.....list genres'
				list_genres
			when 'list artist'
				puts 'ok.....list artist'
				list_songs_by_artist

			when 'list genre'
				puts 'ok.....list genre'
				list_songs_by_genre

			when 'play song'
				puts 'ok.....play song'
				play_song

			when 'exit'
				return

			else
			puts "_______________________________________________"
			puts "_______________________________________________"
			puts "_______________________________________________"
			puts "You gave me #{user_input} -- I have no idea what to do with that."
			puts "_______________________________________________"
			puts "_______________________________________________"
			puts "_______________________________________________"
			call
		end
	end
 
	def list_songs
		songs = Song.all.sort_by {|song| song.name}
		songs.each_with_index do |song, index|
			song = "#{index+1}. " + "#{song.artist.name} - " + "#{song.name} - " + "#{song.genre.name}"
			puts song
		end
	end

	def list_artists
		artists = Artist.all.sort_by {|artist| artist.name }
		artists.each_with_index do |artist, index|
			artist = "#{index + 1}. " + "#{artist.name}"
			puts artist
		end
	end


	# def list_artists
  #   Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
  #     puts "#{i}. #{a.name}"
  #   end
	# end
	 

	def list_genres
		Genre.all.each do |genre|
			puts genre.name
		end
	end

  # def list_songs_by_artist
  #   puts "Please enter the name of an artist:"
  #   input = gets.strip

  #   if artist = Artist.find_by_name(input)
  #     artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
  #       puts "#{i}. #{s.name} - #{s.genre.name}"
  #     end
  #   end
  # end

  # def list_songs_by_genre
  #   puts "Please enter the name of a genre:"
  #   input = gets.strip

  #   if genre = Genre.find_by_name(input)
  #     genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
  #       puts "#{i}. #{s.artist.name} - #{s.name}"
  #     end
  #   end
  # end

	# def play_song
  #   puts "Which song number would you like to play?"

  #   input = gets.strip.to_i
  #   if (1..Song.all.length).include?(input)
  #     song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
  #   end

  #   puts "Playing #{song.name} by #{song.artist.name}" if song
	# end
	

	# def list_artists
	# 	Artist.all.each {|artist| puts "#{artist.name}"}
	# end

	# def list_genres
	# 	Genre.all.each {|genre| puts "#{genre.name}"}
	# end

	def play_song
		Song.all.each { |song|  
		puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
	end

	def list_artist
		puts "Please enter artist's name:"
		choice = gets.strip
		
		Song.all.each do |song| 
			if song.artist.name == choice;
				puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
			end
		end
	end

	def list_genre
		puts "Please enter genre name:"
		choice = gets.strip
		
		Song.all.each do |song| 
			if song.genre.name == choice;
				puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
			end
		end
	end


end