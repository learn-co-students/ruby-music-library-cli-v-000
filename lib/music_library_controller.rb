require "pry"
class MusicLibraryController

  def initialize(path = './db/mp3s')
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
    input = gets
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    elsif input == "play song"
      play_song
    end
    until gets == "exit"
      gets
    end
  end

  def list_songs
    list = []
    Song.all.collect {|song| list << "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    a = list.each.collect {|song| song.split(" - ")}
    b = a.sort {|a, b| a[1] <=> b[1]}
    c = b.collect {|song| song.join(" - ")}
    d = c.each_with_index.collect {|song, index| puts "#{index + 1}. #{song}"}
  end

  def list_artists
    list = []
    Artist.all.collect {|i| list << "#{i.name}"}
    list.sort.uniq.each_with_index.collect do |artist, index|
      puts "#{index + 1}. #{artist}"
    end
  end

  def list_genres
    list = []
    Genre.all.collect {|i| list << "#{i.name}"}
    list.sort.uniq.each_with_index.collect do |genre, index|
      puts "#{index + 1}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input)
      list = Artist.find_by_name(input).songs.sort_by{|song| song.name}
      list.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input)
      list = Genre.find_by_name(input).songs.sort_by{|song| song.name}
      list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i - 1
    if input.between?(0, Song.all.length - 1)
      list = Song.all.sort_by {|song| song.name}
      selection = list[input]
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end

end
