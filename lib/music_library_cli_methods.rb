module CLI_Methods

  attr_accessor :array, :name, :song_artist, :song_genre, :song_genre_artist

  def print_results(array, attributes) #method puts out the right response according to which attribute is set to yes when calling the method
    attributes.each {|key, value| self.send("#{key}=", value)}
    i = 1
    array.sort_by(&:name).each do |object|
      puts "#{i}. #{object.name}" if name == 'yes'
      puts "#{i}. #{object.name} - #{object.genre.name}" if song_genre == 'yes'
      puts "#{i}. #{object.artist.name} - #{object.name}" if song_artist == 'yes'
      puts "#{i}. #{object.artist.name} - #{object.name} - #{object.genre.name}" if song_genre_artist == 'yes'
      i+=1
    end
  end

  def list_songs
    print_results(Song.all, song_genre_artist: 'yes') #puts a number and the 'artist name - song name - genre name'
  end

  def list_artists
    print_results(Artist.all, name: 'yes') #puts a number and artist name
  end

  def list_genres
    print_results(Genre.all, name: 'yes') #puts a number and the genre name
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    if Artist.find_by_name(artist) #if the artist is found, puts a number and the song name - genre name
      print_results(Artist.find_by_name(artist).songs, song_genre: 'yes')
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if Genre.find_by_name(genre) #if the genre is found, puts a number and the artist name - song name
      print_results(Genre.find_by_name(genre).songs, song_artist: 'yes')
    end
  end

  def play_song #gets a number, checks that it is between 1 and the number of songs, uses that number as the index in the sorted array of songs to puts out the details
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    if number.between?(1,Song.all.count)
      puts "Playing #{Song.all.sort_by(&:name)[number-1].name} by #{Song.all.sort_by(&:name)[number-1].artist.name}"
    end
  end

end
