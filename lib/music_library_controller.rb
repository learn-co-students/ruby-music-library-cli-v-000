require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
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
          list_songs
          play_song
      end
    end
  end

  def list_songs
      Song.all.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    list = Artist.all.sort_by {|artist|artist.name}
    list.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
  end

  def list_genres
    list = Genre.all.sort_by {|genre|genre.name}
    list.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist != nil
      artist.songs.sort_by{|song|song.name}.each_with_index {|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre != nil
      genre.songs.sort_by{|song|song.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    list = Song.all.sort_by {|song| song.name}
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input < list.length
      puts "Playing #{list[input-1].name} by #{list[input-1].artist.name}"
    end
  end
end
