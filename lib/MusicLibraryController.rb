class MusicLibraryController

  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    new_group = MusicImporter.new(path)
    new_group.import
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
    input = gets.strip

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

    call unless input == "exit"

  end

  def list_songs
    counter = 0
    song_alphabetical = Song.all.sort_by { |song| song.name}
    song_alphabetical.each do |song|
      puts "#{counter += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    counter = 0
    artist_alphabetical = Artist.all.sort_by { |artist| artist.name}
    artist_alphabetical.each do |artist|
      puts "#{counter += 1}. #{artist.name}"
    end
  end

  def list_genres
    counter = 0
    genres_alphabetical = Genre.all.sort_by { |genre| genre.name}
    genres_alphabetical.each do |genre|
      puts "#{counter += 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      songs_alphabetical = artist.songs.sort_by { |song| song.name }
      counter = 0
      songs_alphabetical.each do |song|
        puts "#{counter += 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      songs_alphabetical = genre.songs.sort_by { |song| song.name }
      counter = 0
      songs_alphabetical.each do |song|
        puts "#{counter += 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp().to_i

    song_alphabetical = Song.all.sort_by { |song| song.name}

    if input < song_alphabetical.length && input > 0
      puts "Playing #{song_alphabetical[input - 1].name} by #{song_alphabetical[input - 1].artist.name}"
    end

  end




end
