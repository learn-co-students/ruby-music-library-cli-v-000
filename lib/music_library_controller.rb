class MusicLibraryController

  def initialize(path = "./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end

  def call
      puts "Welcome to your music library!"
      self.menu
  end

  def menu
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    case gets.chomp.downcase
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
      when "exit"
        "exit"
      else
        self.menu
    end
  end

  def generate_song_list
    Song.all.sort_by {|song| song.name}
  end

  def list_songs
    songs = self.generate_song_list

    songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}

    artists.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}

    genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    if artist = Artist.find_by_name(input)
      song_list = artist.songs.sort_by {|song| song.name}

      song_list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp

    if genre = Genre.find_by_name(input)
      song_list = genre.songs.sort_by {|song| song.name}

      song_list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i - 1
    song_list = self.generate_song_list
    song = song_list[input]

    if input > 0 && input <= Song.all.length && song != nil
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
