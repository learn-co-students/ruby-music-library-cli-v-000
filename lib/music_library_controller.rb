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

  def validate_class(classname)
  	['Artist', 'Genre'].include?(classname) ? classname : false
  end

  def validate_choice(classname)
		valid = false
    print "OK: which #{classname}? "
  	while !valid
  		input = gets.chomp
  		valid = Object.const_get(classname).find_by_name(input)
  		if !valid 
  			puts 'Um... I\'m not seeing it. Check the spelling and try again.'
  		end
  	end
  	valid
  end

  def list_artist_genre(command)
  	valid_classname = validate_class(command[5..-1].capitalize)
  	if !valid_classname
  		begin
  			raise StandardError
  		rescue
  			"Whoops.. That's not right..."
  		end
  	else
	    validate_choice(valid_classname).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
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