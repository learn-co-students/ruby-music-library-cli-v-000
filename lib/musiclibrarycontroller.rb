class MusicLibraryController

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
    user_input = []
    until user_input == "exit" do
      user_input = gets.strip
      case user_input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      end
    end

  end

  def list_songs
    i = 1
    sorted_songs = Song.all.sort_by { |song| song.name }

    sorted_songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end

  end

  def list_artists
    i = 1
    sorted_artists = Artist.all.sort_by { |artist| artist.name }

    sorted_artists.each do |artist|
        puts "#{i}. #{artist.name}"
        i += 1
    end
  end

  def list_genres
    i = 1
    sorted_genres = Genre.all.sort_by { |genre| genre.name }

    sorted_genres.each do |genre|
        puts "#{i}. #{genre.name}"
        i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist = Artist.find_by_name(user_input)
    if artist
      i = 1
      sorted_songs = artist.songs.sort_by { |song| song.name }

      sorted_songs.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre = Genre.find_by_name(user_input)
    if genre
      i = 1
      sorted_songs = genre.songs.sort_by { |song| song.name }

      sorted_songs.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
    if (user_input > 0) && (user_input < Song.all.size)
      song = Song.all.sort_by { |song| song.name }[user_input-1]
      if song
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end

end
