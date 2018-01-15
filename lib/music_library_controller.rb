require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    imported = MusicImporter.new(path)
    imported.import
  end

  def call
    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    input = gets.strip
    options
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

  def options
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
  end

  def list_songs
     list = Song.all.sort {|a, b| a.name <=> b.name}
     list.map.with_index do |song, index|
       puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
  end

  def list_artists

  end

end
