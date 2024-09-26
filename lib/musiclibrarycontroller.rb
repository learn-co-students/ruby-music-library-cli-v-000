class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == 'list genre'
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
    end
  end

  def list_songs
    i = 1
    songs = Song.all.sort_by {|song| song.name}
    songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 1
    artists = Artist.all.sort_by {|artist| artist.name}
    artists.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    i = 1
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.each do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist
      songs = artist.songs.sort_by {|song| song.name}
      i = 1
      songs.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.strip)
    if genre
      songs = genre.songs.sort_by {|song| song.name}
      i = 1
      songs.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input <= Song.all.length
      songs = Song.all.sort_by {|song| song.name}
      puts "Playing #{songs[input - 1].name} by #{songs[input - 1].artist.name}"
    end
  end

end
