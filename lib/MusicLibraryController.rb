class MusicLibraryController

	def initialize(path = "./db/mp3s")
		import = MusicImporter.new(path)
		import.import
	end

	def call
		input = ""
		while input != "exit"
			puts "What do you want to do?"
			input = gets.chomp
			case input
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
			end
		end
	end

	def songs
    	Song.all.each.with_index do |s, i|
      		puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    	end
	end

	def artists
		Artist.all.each_with_index do |a, i|
			puts "#{i+1}. #{a.name}"
		end
	end

	def genres
	    Genre.all.each.with_index do |g, i|
      		puts "#{i+1}. #{g.name}"
    	end
	end

	def list_artist
		puts "Name an artist and I'll list all their songs."
   		artist_input = gets.strip
    		if artist = Artist.find_by_name(artist_input)
      			artist.songs.each_with_index do |s,i|
       			puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
		   		end
       		else 
       		puts "Sorry, try another artist."
     	end	
	end

	def list_genre
		puts "Name a genre and I'll list all their songs for ya."
    	genre_input = gets.strip
    		if genre = Genre.find_by_name(genre_input)
      			genre.songs.each_with_index do |s,i|
        		puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      			end
    		end
	end

	def play_song
	puts "What song number would you like to play?"
    song_input = gets.strip
    play = Song.all[song_input.to_i-1]
    puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name}"
	end

end