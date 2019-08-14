class MusicLibraryController

  def initialize(path='./db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_response = ""
    while user_response != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_response = gets.strip
      case user_response
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist(user_response)
      when "list genre"
        self.list_songs_by_genre(user_response)
      when "play song"
        self.play_song
      end
    end
  end

  def sort_library_by(type)
    sorted = []
    case type
    when "song"
      sorted = Song.all.sort{|a,b| a.name <=> b.name}
    when "artist"
      sorted = Artist.all.uniq.sort{|a,b| a.name <=> b.name}
    when "genre"
      sorted = Genre.all.uniq.sort{|a,b| a.name <=> b.name}
    end
    sorted
  end

  def list_songs
    counter = 1
    sorted_songs = self.sort_library_by("song")
    sorted_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    sorted_artists = self.sort_library_by("artist")
    sorted_artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    sorted_genres = self.sort_library_by("genre")
    sorted_genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist != nil
      counter = 1
      artist.songs.uniq.sort{|a,b| a.name <=> b.name}.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre != nil
      genre.songs.uniq.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i

    sorted_songs = self.sort_library_by("song")
    max = sorted_songs.count

    if input != nil && input != 0 && input <= max
      song = sorted_songs[input - 1].name
      artist = sorted_songs[input - 1].artist.name
      puts "Playing #{song} by #{artist}"
    end
  end










end
