require'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import

  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "What would you like to do?"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip
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

  def play_song
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i+1
    if song_input.between?(1, Song.all.count+1)
      puts "Playing #{list_songs[song_input.to_i-1].name} by #{list_songs[song_input.to_i-1].artist.name}"
    end
  end

  def list_songs
    Song.sorted.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.sorted.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.sorted.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip

    artist = Artist.find_by_name(artist_input)
      if artist
        artist.songs.sorted.each do |song|
          puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
      if genre
        genre.songs.sorted.each do |song|
          puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      end
  end
end
