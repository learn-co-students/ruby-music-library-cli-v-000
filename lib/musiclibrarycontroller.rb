require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
  importer = MusicImporter.new(path)
  @importer = importer
  @importer.import
  end

  def call
    input=""
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
    Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}.each_with_index{|song, index| puts "#{index+1}. #{song}"}
    # counter = 0
    # Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}.each do |song|
    # puts "#{counter+=1}. #{song.to_s}"
    # end
  end

  def list_artists
    artist_list = Artist.all.uniq{|artist| artist.name}.sort{|artist_a, artist_b| artist_a.name <=> artist_b.name}

    counter = 0
    artist_list.each do |artist|
    puts "#{counter+=1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.uniq{|genre| genre.name}.sort{|genre_a, genre_b| genre_a.name <=> genre_b.name}

    counter = 0
    genre_list.each do |genre|
    puts "#{counter+=1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      counter = 0
      Artist.find_by_name(input).songs.sort{|song_a, song_b| song_a.name <=> song_b.name}.each { |song|  puts "#{counter+=1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
    counter = 0
    Genre.find_by_name(input).songs.sort{|song_a, song_b| song_a.name <=> song_b.name}.each {|song| puts "#{counter+=1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
      if (1..Song.all.length).include?(input)
        song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
      end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
# binding.pry
# input =""
# until input == Artist.find_by_name(input)
# puts "Please enter the name of an artist:"
# input = gets.strip
# end
#   counter = 0
#   input.all.each {|artist| artist.songs}.each { |song|
#     puts "#{counter+=1}. #{self.name} - #{self.genre.name}"}
