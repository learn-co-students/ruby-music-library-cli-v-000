module CLI_Methods

  attr_accessor :array, :name, :song_artist, :song_genre, :song_genre_artist

  def print_results(array, attributes)
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
    print_results(Song.all, song_genre_artist: 'yes')
  end

  def list_artists
    print_results(Artist.all, name: 'yes')
  end

  def list_genres
    print_results(Genre.all, name: 'yes')
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    if Artist.find_by_name(artist)
      print_results(Artist.find_by_name(artist).songs, song_genre: 'yes')
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if Genre.find_by_name(genre)
      print_results(Genre.find_by_name(genre).songs, song_artist: 'yes')
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    if number.between?(1,Song.all.count)
      puts "Playing #{Song.all.sort_by(&:name)[number-1].name} by #{Song.all.sort_by(&:name)[number-1].artist.name}"
    end
  end

end
