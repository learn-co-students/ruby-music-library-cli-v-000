class MusicLibraryController
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
    input = gets.strip

    if input != "exit"
      call
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
    input = gets.chomp # "artist = Real Estate"
    # 1. Green Aisles - country
    binding.pry
    artist = Artist.all.find {|artist| artist.name == input}
    artist_songs = artist.songs.sort_by {|song| song.name}
    artist_songs.each_with_index do |song, index|
      index += 1
      puts "#{index}. #{artist_songs.name} - #{artist_songs.genre.name}"
    end
  end

end
