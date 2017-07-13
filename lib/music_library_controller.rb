require "pry"
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = " "

    while input.downcase != 'exit'
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

      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end

  def list_songs
    alphabetized_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    alphabetized_artists = Artist.all.uniq.sort{|artist1, artist2| artist1.name <=> artist2.name}
    alphabetized_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    alphabetized_genres = Genre.all.uniq.sort{|genre1, genre2| genre1.name <=> genre2.name}
    alphabetized_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if Artist.find_by_name(artist_name)
      artist = Artist.find_by_name(artist_name)
      alphabetized_songs_for_artist = artist.songs.uniq.sort{|song1, song2| song1.name <=> song2.name}
      alphabetized_songs_for_artist.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp

    if Genre.find_by_name(genre_name)
      genre = Genre.find_by_name(genre_name)
      alphabetized_songs_for_genres = genre.songs.uniq.sort{|genre1, genre2| genre1.name <=> genre2.name}
      alphabetized_songs_for_genres.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i

    if input > 0 && input <= Song.all.length
      song = alphabetized_songs[input -1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end


  private

  def alphabetized_songs
    Song.all.uniq.sort{|song1, song2| song1.name <=> song2.name}
  end
end
