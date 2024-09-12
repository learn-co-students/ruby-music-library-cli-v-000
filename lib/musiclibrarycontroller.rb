class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
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
    input = ""

    while input != "exit"
      input = gets.chomp
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end



  end

  def list_songs
    songs = Song.all.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
      index += 1
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}
    artists.each_with_index do |artist, index|
      index += 1
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.each_with_index do |genre, index|
      index += 1
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input) == nil
      return "Artist not found"
    else
      artist = Artist.all.find {|artist| artist.name == input}
    end

    artist_songs = artist.songs.sort_by {|song| song.name}
    artist_songs.each_with_index do |song, index|
      index += 1
      puts "#{index}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input) == nil
      return "Genre not found"
    else
      genre = Genre.all.find {|genre| genre.name == input}
    end

    genre_songs = genre.songs.sort_by {|song| song.name}
    genre_songs.each_with_index do |song, index|
      index += 1
      puts "#{index}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i - 1
    songs = Song.all.sort_by {|song| song.name}

    if input >= 0 && input < songs.count
      puts "Playing #{songs[input].name} by #{songs[input].artist.name}"
    else
      return "Invalid song"
    end

  end

end
