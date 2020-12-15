#require "MusicImporter"

class MusicLibraryController
  attr_reader :path

  def initialize(path ='./db/mp3s')
    @path = path
    @musicimporter = MusicImporter.new(path)
    @musicimporter.import
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
    input = gets.chomp
    until input == exit do
      input = gets.chomp
    end
  end

  def list_songs
      songs = Song.all
      sorted_songs = songs.sort_by do |song|
        song.name
      end
      sorted_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"#+1 is adding one to index
      end
  end

  def list_artists
    artists = Artist.all
    sorted_artists = artists.sort_by { |artist| artist.name }
    sorted_artists.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all
    sorted_genres = genres.sort_by { |genre| genre.name }
    sorted_genres.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist =  Artist.find_by_name(artist_name)#artist object
    if artist #if actual object is the same as true and Nil is considered false
      sorted_songs = artist.songs.sort_by { |song| song.name }#sorted array of songs
      sorted_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"#song name/genre
      end
    end
  end

  def list_songs_by_genre #artist nam and song name
    puts 'Please enter the name of a genre:'
    genre_input = gets.chomp
    genre = Genre.find_by_name(genre_input)
    if genre  #if actual object is the same as true and Nil is considered false
      sorted_songs = genre.songs.sort_by { |song| song.name }#sorted array of genres
      sorted_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"#how do I access the artists method through the genre class
      end
    end
  end


  def play_song
    puts 'Which song number would you like to play?'

  end

end
