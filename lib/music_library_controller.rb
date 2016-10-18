class MusicLibraryController

	def initialize(path='./db/mp3s')
		music_importer = MusicImporter.new(path)
		music_importer.import
	end

  def list_songs
		Song.all.each_with_index {|song,index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def play_song
		print 'Enter a song\'s number: '
		song_number = gets.chomp.to_i - 1
		if !Song.all[song_number]
			puts 'Um... I\'m not seeing it. Check that number and try again.'
    else
    	playing_song = Song.all[song_number]
      puts "Playing #{playing_song.artist.name} - #{playing_song.name} - #{playing_song.genre.name}"
    end
  end

  def list_artist_genre(command)
  	target_class = command[5..-1]
  	if target_class != 'artist' && target_class != 'genre'
  		begin
  			raise StandardError
  		rescue
  			"Whoops.. That's not right..."
  		end
  	else
	    print "OK: which #{target_class}? "
	  	input = gets.chomp
	    list = Object.const_get(target_class.capitalize).find_by_name(input)
	    if !list
	    	puts 'Um... I\'m not seeing it. Check the spelling and try again.'
	    else
	    	list.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
	    end
	  end
  end

	def call
		input = ''
		puts "Welcome to the Music Library.\nYour options are:"
		while input != 'exit'
			puts "--- list songs, list artists, list genres, play song, list artist, list genre, exit"
			input = gets.chomp
			case
			when input == "list songs"
				list_songs
			when input == "list artists" || input == "list genres"
				classname = input[5..-2].capitalize
				Object.const_get(classname).all.each {|item| puts item.name}
			when input == "play song"
				play_song
      when input == "list artist" || input == "list genre"
      	list_artist_genre(input)
    	when input == "exit"
      	puts "See you next time!"  	
			else
				puts 'I don\'t understand... Please try again.'
			end
		end
	end

end