require 'pry'
class MusicLibraryController
  def initialize (path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
    @sorted_songs = Song.all.sort { | a, b | a.name <=> b.name }
  end

  def welcome
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def call
    welcome
    input = ""
    until input == "exit"
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
    @sorted_songs.each_with_index do | song, count |
      puts "#{count+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    list_by_name(Artist.all)
  end

  def list_genres
    list_by_name(Genre.all)
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp

    list = Song.all.select { | song | song.artist.name == artist_name }
    list.sort!{ | a, b | a.name <=> b.name }

    list.each_with_index { | song, count | puts "#{count+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp

    list = Song.all.select { | song | song.genre.name == genre_name }
    list.sort!{ | a, b | a.name <=> b.name }

    list.each_with_index { | song, count | puts "#{count+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    selection = gets.chomp.to_i
    selection -= 1
    if selection >=0 && selection <@sorted_songs.count
      puts "Playing #{@sorted_songs[selection].name} by #{@sorted_songs[selection].artist.name}"
    end
  end

  private

  def list_by_name (all)
    list = all.collect { |item| item.name }
    list.sort!.each_with_index {|name, count| puts "#{count+1}. #{name}"}
  end

end
