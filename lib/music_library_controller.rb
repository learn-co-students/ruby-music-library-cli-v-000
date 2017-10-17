require 'pry'

class MusicLibraryController

  #attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).path
  end

  def call
    input = nil
    while input != "exit"
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
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_song_by_artist
      when 'list genre'
        list_song_by_genre
      when 'play song'
        play_song
      end
    end
  end

  def list_songs
    sorted_by_song_name = Song.all.sort{|a, b| a.name <=> b.name}
    #binding.pry
    sorted_by_song_name.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  #binding.pry
  def list_artists
  end

  def list_genres
  end
  def list_song_by_artist
  end
  def list_song_by_genre
  end
  def play_song
  end

end
#music = MusicLibraryController.new("./spec/fixtures/mp3s")
#music.list_songs
#binding.pry
