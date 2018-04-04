class MusicLibraryController
  attr_accessor :path
  attr_reader :input

  def initialize(path = './db/mp3s')
    library = MusicImporter.new(path)
    library.import
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

    @input = gets.chomp

    until @input = exit
      puts "What would you like to do?"
    end

  end

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    binding.pry
  end

  def list_artists
      artists = Artist.all.sort_by {|artist| artist.name}
      artists.each_with_index { |artist, i| puts "#{i + 1}. #{artist.name}"}
  end

  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.each_with_index { |genre, i| puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
      if Artist.all.detect {|artist| artist.name == input}
        artist = Artist.all.detect {|artist| artist.name == input}
        artist_songs = artist.songs.sort_by {|song| song.name}
        artist_songs.each_with_index {|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.all.detect {|genre| genre.name == input}
      genre = Genre.all.detect {|genre| genre.name == input}
      genre_songs = genre.songs.sort_by {|song| song.name}
      genre_songs.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
  end

end
