class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    while input != 'exit'
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
        self.list_artists
      elsif input == 'list genres'
        self.list_genres
      elsif input == 'list artist'
        self.list_songs_by_artist
      elsif input == 'list genre'
        self.list_songs_by_genre
      elsif input == 'play song'
        self.play_song
      end
    end
  end

  def list_songs
    sort_songs = Song.all.sort{|song1, song2| song1.name <=> song2.name }
    sort_songs.each_with_index do |song, count|
      puts "#{count + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sort_artists = Artist.all.sort{|artist1, artist2| artist1.name <=> artist2.name }
    sort_artists.each_with_index do |artist, count|
      puts "#{count + 1}. #{artist.name}"
    end
  end

  def list_genres
    sort_genres = Genre.all.sort{|genre1, genre2| genre1.name <=> genre2.name }
    sort_genres.each_with_index do |genre, count|
      puts "#{count + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if Artist.find_by_name(artist_name)
      artist = Artist.find_by_name(artist_name)
      sorted_songs = artist.songs.sort{|song1, song2| song1.name <=> song2.name}

      sorted_songs.each_with_index do |song, count|
        puts "#{count + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    if Genre.find_by_name(genre_name)
      genre = Genre.find_by_name(genre_name)
      sorted_songs = genre.songs.sort{|song1, song2| song1.name <=> song2.name}

      sorted_songs.each_with_index do |song, count|
        puts "#{count + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    sorted = Song.all.sort{ |song, song2| song.name <=> song2.name }
      puts "Which song number would you like to play?"
      input = gets.chomp.to_i
      if input.between?(1, sorted.size)
        puts "Playing #{sorted[input - 1].name} by #{sorted[input - 1].artist.name}"
      end
  end
end
