require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
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

    input = ""
    while input != "exit"
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
  end
  end

  def list_songs #why the error?
    Song.all.sort_by{|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists #uses sort_by shorthand
    Artist.all.sort_by(&:name).each_with_index {|artist, index| puts "#{index+1}. #{artist.name}" }
  end

  def list_genres #uses sort_by shorthand
    Genre.all.sort_by(&:name).each_with_index {|genre, index| puts "#{index+1}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.sort_by(&:name).each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    else
      "No such artist"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      Genre.find_by_name(input).songs.sort_by(&:name).each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    else
      "No such artist"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
    song = Song.all.sort_by(&:name)[input-1]
    if input >= 1 && song
      puts "Playing #{song.name} by #{song.artist.name}"
    else
      "Not valid"
    end
  end

end
