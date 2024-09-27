require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
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
    list_songs if input == 'list songs'
    list_artists if input == 'list artists'
    list_genres if input == 'list genres'
    list_songs_by_artist if input == 'list artist'
    list_songs_by_genre if input == 'list genre'
    play_song if input == 'play song'
  end
  end

  def list_songs
    Song.all.sort_by{|song|song.name}.each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|artist|artist.name}.each_with_index do |artist,index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre|genre.name}.each_with_index do |genre,index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    output = ""
    if artist != nil
      artist.songs.sort_by{|song|song.name}.each_with_index{|song,index| puts "#{index+1}. #{song.name} - #{song.genre.name}"
      output << "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
    output
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    output = ""
    if genre != nil
      genre.songs.sort_by{|song|song.name}.each_with_index{|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name}"
      output << "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
    output
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    if input.to_i.between?(1,Song.all.size)
      sorted = Song.all.sort_by{|song|song.name}
      puts "Playing #{sorted[input.to_i-1].name} by #{sorted[input.to_i-1].artist.name}"
    end
  end

end
