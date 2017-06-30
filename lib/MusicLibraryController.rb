require "pry"

class MusicLibraryController
  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
          play_song
      end
    end
  end

  def list_songs
    list = Song.class_variable_get(:@@all).sort{|a,b| a.name <=> b.name}
      list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    list = Artist.class_variable_get(:@@all).sort{|a,b| a.name <=> b.name}
      list.each.with_index(1) do |artist, index|
        puts "#{index}. #{artist.name}"
      end
  end

  def list_genres
    list = Genre.class_variable_get(:@@all).sort{|a,b| a.name <=> b.name}
      list.each.with_index(1) do |genre, index|
        puts "#{index}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    input = ""
    puts "Please enter the name of an artist:"
    input = gets.strip
    if input = Artist.find_by_name(input)
      list = input.songs.sort{|a,b| a.name <=> b.name}
      list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    input = ""
    puts "Please enter the name of a genre:"
    input = gets.strip
    if input = Genre.find_by_name(input)
      list = input.songs.sort{|a,b| a.name <=> b.name}
      list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
  list = Song.all.sort{|a,b| a.name <=> b.name}
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i.between?(1,list.size)
      puts "Playing #{list[input.to_i-1].name} by #{list[input.to_i-1].artist.name}"
    end
  #s  binding.pry
  end

end
